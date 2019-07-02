Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 3104A5CEF5
	for <lists+samba-technical@lfdr.de>; Tue,  2 Jul 2019 13:58:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=7/HFLPd2MK59ZrEZhP5yKOPBMgZWWenS4H9kHfv2pQE=; b=xjnoRzqtL773RcT0M3I14gMF2a
	aoxHU2UU4h5+OQAiKXPx3ZZliEb5FUXe9CMgNzUR4yucL3BL3jdwhOYXOEJnaYYMCHz5W0CJW1bmU
	SM9MbF9WcpTFKCGz0ZU4BS5tEsByfZp0rcPN8CIIxXdcpQOO62xDc56exuQK7ZKpXCQkELJBqceVo
	KI8aGFOwGjUXK3A5uaEFv3Jr9wqVqdDDfMxEBAPV9CqL1gn9tugA3V4bMZ1se7t2GOVHupPipaR74
	S6CZoONA1HoB2JvB1pa7ewH22bwXUmqcsGQrDrcoSaFrBWc3lw3QvXXnvpEv9qC5KveZOSkXbM2YX
	fsRPMTig==;
Received: from localhost ([::1]:46852 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hiHPv-004UDo-2x; Tue, 02 Jul 2019 11:57:47 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132]:46663) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hiHPq-004UDh-Fd
 for samba-technical@lists.samba.org; Tue, 02 Jul 2019 11:57:44 +0000
Received: by mail-lf1-x132.google.com with SMTP id z15so11140328lfh.13
 for <samba-technical@lists.samba.org>; Tue, 02 Jul 2019 04:57:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=8q3S2b1MC/T/eaSDozW2P1L4rbRZY1S+gTOm1xeZ7Q0=;
 b=ei7Ibc9dQv3//X3xu3/rngqTvGwiM8xwmH9a8pVZ/Y8XrNebFCxPgfRmfBKHR7RRO6
 dJ2av91r/QdWhwHQTlFoFIMWEdKL4sb3MHSwYhKZlTZRPMtqC4UjYknMiEMjTFzYJXlx
 2pcdtzqunRUtD9134lkDbqPguXQDmOdnqbJszk4vb432tY7Qppj+VFmJxVXVXXFS8cIC
 B8px3RArVgBKiBZCnUI0sZlqcTXwc/7JibqvwVD327IPmGJI+w8MPfSFiDfCab+kJdr9
 soyJGZU00rI5DRqTTGAB0qLsdA6Rs1YfVebu+pe/uJgKEixYpbJDOfcAzA9xKdylDwXD
 diVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=8q3S2b1MC/T/eaSDozW2P1L4rbRZY1S+gTOm1xeZ7Q0=;
 b=j7rqgYNlRp9jeG0L5QHPs3NDzIVglcRBiid0UBjlnDf7CM3w6riIM/zbvwVO7dkGgr
 w1101tBfBXnUc2pw/LJRKyZAgJydvoblLLk15rsoGIrAc0CN9/G/84D3pZmj6XkcjYDF
 Iq/rKEgKXFqB69iUsoK4AdL045gOgHidoFINWLQNmHVHe3Y46H2troNLyEUpg/8xUGnv
 2AJiGCCqHxLEEm2PMlsoksuy0JWRhoUKWdP/66bIRZY7LjX6O/BfmQh79h1cKCTINSgH
 4A3ZUadq2K/sN6i/5LORUEZETw7SCQnN6d1+bCfIlIql4O2YRiiviOgZJAKw0sn1GE9D
 R/lQ==
X-Gm-Message-State: APjAAAVMDnMEzfb//ll7zRUPlVgqv9EkHw6NFNFkPhN5/0uPWPGOVc8+
 V9tRYPJ1DTEC8lqnBnr8cQHD6rp2b/fjqmVoI6OfS4o+ltIX0A==
X-Google-Smtp-Source: APXvYqzNIs20NWTyQAKwYkIr67R0NF54jU5IYRkhxSqkJ/hrH+m76ihh1/cVTplbdtFpM+ZtnXmsq5gsN554ewfi69Q=
X-Received: by 2002:ac2:4c3c:: with SMTP id u28mr15089921lfq.136.1562068660924; 
 Tue, 02 Jul 2019 04:57:40 -0700 (PDT)
MIME-Version: 1.0
Date: Tue, 2 Jul 2019 12:56:38 +0100
Message-ID: <CAELK94fFcDARR01muXi_R429VgL744x=9cYB7c+bnRgjuPYE=A@mail.gmail.com>
Subject: GSOC 2019 : Improve smbcmp - Best format to use for diffs
To: P Mairo via samba-technical <samba-technical@lists.samba.org>
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.29
X-BeenThere: samba-technical@lists.samba.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "Discussions on Samba internals. For general questions please
 subscribe to the list samba@lists.samba.org"
 <samba-technical.lists.samba.org>
List-Unsubscribe: <https://lists.samba.org/mailman/options/samba-technical>,
 <mailto:samba-technical-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/samba-technical/>
List-Post: <mailto:samba-technical@lists.samba.org>
List-Help: <mailto:samba-technical-request@lists.samba.org?subject=help>
List-Subscribe: <https://lists.samba.org/mailman/listinfo/samba-technical>,
 <mailto:samba-technical-request@lists.samba.org?subject=subscribe>
From: P Mairo via samba-technical <samba-technical@lists.samba.org>
Reply-To: P Mairo <akoudanilo@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hello,
Yesterday I discovered the json output of Tshark and as I have to implement
better diffs, I thought why not?
So looking at it more closely today, I realized that it would be more
appropriate because all the irrelevant fields we discussed about previously
are automatically removed and the data structure is convenient for
navigation.
As a sum up, I want to deviate a little bit from the initial plan (use XML)
to reach the same goal (better diffs).
What are your insights on this?

regards.

-- 
https://github.com/RMPR
