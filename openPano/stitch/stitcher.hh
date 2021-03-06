// File: stitcher.hh
// Date: Mon Jan 08 11:49:29 2018 -0800
// Author: Yuxin Wu <ppwwyyxxc@gmail.com>

#pragma once
#include <memory>
#include <vector>
#include "openPano/lib/mat.h"
#include "openPano/lib/utils.hh"
#include "stitcher_image.hh"
#include "stitcherbase.hh"
#include "match_info.hh"
#include "common/common.hh"

namespace pano {

// forward declaration
class PairWiseMatcher;

class Stitcher : public StitcherBase {
	private:
		// transformation and metadata of each image
		ConnectedImages bundle;

		// 2d array of all matches
		// pairwise_matches[i][j].homo transform j to i, with coor in [-w/2,w/2]
		std::vector<std::vector<MatchInfo>> pairwise_matches;

		// match two images
		bool match_image(const PairWiseMatcher&, int i, int j);

		// pairwise matching of all images
		void pairwise_match();
		// equivalent to pairwise_match when dealing with linear images
		void linear_pairwise_match();

		// assign a center to be identity
		void assign_center();

		// build by estimating camera parameters
		void estimate_camera();

		// naively build panorama assuming linear imgs
		void build_linear_simple();

		// for debug
		void draw_matchinfo();
		void dump_matchinfo(const char*) const;
		void load_matchinfo(const char*);
	public:
		template<typename U, typename X =
			disable_if_same_or_derived<Stitcher, U>>
			Stitcher(U&& i) : StitcherBase(std::forward<U>(i)) {
				bundle.component.resize(imgs.size());
				REP(i, imgs.size())
					bundle.component[i].imgptr = &imgs[i];
			}

		virtual Mat32f build();
};

}
