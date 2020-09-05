Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F68725E50F
	for <lists+samba-technical@lfdr.de>; Sat,  5 Sep 2020 04:23:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=17y/c0++OSfkE81d2P+sb7dSz4gERxkYYNXYOXgVT2s=; b=MT0ocn/T3hsb9TGFltNzleHt/4
	bZkBldgbmKMuTnnIt6KB345e00SuFiE8PfSfCpAmly1UMT4SMNuXql6omGVPi+A4aXe2EWY3AKXwv
	bVSvdn7km/FUTXbHZxsCER6P+PpueQDt6jMzbr6Dfd+vasNUrQUf7DEwvP/i8+XYIUL9B5KUxI8Ss
	yJmVUoUKb40E5s4KTN9EkMyue2edVp4JGQ0QCOXEKbOUhQYpxQz0Ha/L26GeikRgfThdAP3g5nh/i
	sTp0l7Twh1QN/B6vCFQU3QcwJChwNAkRqFeoIbmJ3LP2twozqUR/0izjOVMzmcbgb7v2oRzGxJqh/
	/m+Ilkhw==;
Received: from localhost ([::1]:30412 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kENqo-00457Q-Id; Sat, 05 Sep 2020 02:22:46 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:22366) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kENqk-00457J-Bw
 for samba-technical@lists.samba.org; Sat, 05 Sep 2020 02:22:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=17y/c0++OSfkE81d2P+sb7dSz4gERxkYYNXYOXgVT2s=; b=PvmnEOGsPicQ1RhVb4yjdqEa0L
 Y0LuEY+oD+1LjRdxh06I31PgFIdEBgeKeBGx01FytnsZ56U81qmXgwwyIMVPO/E2J5osY4zlj7aU/
 1m3d72/+A5VlS0+TgSgOZj4brBpLMKvYCnET+CNj8axCjC0mYNgRQ859ofbHRvLJu0+tFbrjf3rtS
 CelryiTFjOqIXNFtGh5/StSmZI4bS8ZZ7DBEoVPpwKFF9ylig/cvMYGMZDI6LLYUZJNDbjZDu6vGK
 X/Fb0I5IEzcF6X8t8Q92CMImGGKm49x13z2fCivJa8Ox6jmlgGPAps0Ff0Af+iNjMVDu/QKod7uHG
 hNSkJ+Ia43qaKYjBpk26QEr4XcBXMAvfAb4WraSHfw1Cu9liQSbwMsy75yjmWksZBgoHDkRQvgCvU
 iu6ciE8tDNhtCnx8ytKGI28nTJPpPhpW5II5ty8ReJQn1uTjebtcJ2TxF47XAxYd4G5hbakE7clCo
 jkBsoMbqrZNZ2eYzi5cksENU;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kENqf-00019B-0A
 for samba-technical@lists.samba.org; Sat, 05 Sep 2020 02:22:37 +0000
Message-ID: <d3abac97b731ed0d37ea4dec28e2792128f527dd.camel@samba.org>
Subject: Drop Python2 for the build?
To: samba-technical@lists.samba.org
Date: Sat, 05 Sep 2020 14:22:34 +1200
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5 (3.36.5-1.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
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
From: Andrew Bartlett via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andrew Bartlett <abartlet@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Just wondering when might be the time to drop the python2 build?

This came to mind because David Disseldorp recently had to adjust build
system changes to cope with python2, so I figured it might be time to
revisit this.

March 2021 will be 12 months after the long-delayed EOL for Python2 and
since we made last made big decisions around this area Python3 has
become available in the default package set for more platforms,
particularly including CentOS 7.

We currently spend CI resources building and smoke testing Samba with a
python2, which we could save, as well as the (small) complexity of
targeting both python versions.

The simplest change would change the minimum python to build Samba to
3.5, the same as we set the minimum to for fuzzing, or just 3.6 the
same as we already require otherwise (this would be better tested).

As background, the first Samba release with python3 support, 4.10, was
released in March 2019, so if we did this for 4.14 this would be a two-
year gap.

What do folks think?

Importantly: beyond Linux, how is python3 platform support better now?

Thanks,

Andrew Bartlett
-- 
Andrew Bartlett                       http://samba.org/~abartlet/
Authentication Developer, Samba Team  http://samba.org
Samba Developer, Catalyst IT          http://catalyst.net.nz/services/samba



