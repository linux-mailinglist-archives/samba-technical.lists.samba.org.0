Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id A948C3FCFF1
	for <lists+samba-technical@lfdr.de>; Wed,  1 Sep 2021 01:33:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=qWnM7YPAOoXvYDxBQDy2ull6nlOC2QI3Q/xmnnDOtZc=; b=hA7MvlLlDprRPYUTb5WnyQC5Jq
	Slx1k/0FM/iJYlnsk5jLwc9r/dEoFgww0ZlpjhezNhsuJGzpL1J0foMMD7j3if6ruQQmFkGjpMkpv
	lKeBXL8k0k86dfd+j+dVzyq0bTKrXf+aLHNwg8pXleTGfD3FQOmXl5ivxU0gQ2Z5N1rprjxw1pmvw
	nyMomaNNVuy/6ZKP5cSLFlEsLdBWslGljBB1O3T+QKq2CiHnqVWu1TfSoxgNdWNZnft1e4h9lSeBh
	xXql+WeQRPw37Ted4PA1SrF4isxpctC9qtFBYbMrXjD+cgSZu13+CCLD+g4nKAy9/vHgX+enwJ7ah
	wmrclXlg==;
Received: from ip6-localhost ([::1]:65430 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1mLDFw-00APa9-Md; Tue, 31 Aug 2021 23:33:28 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130]:37639) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1mLDFs-00APa0-05
 for samba-technical@lists.samba.org; Tue, 31 Aug 2021 23:33:26 +0000
Received: by mail-lf1-x130.google.com with SMTP id l10so2474400lfg.4
 for <samba-technical@lists.samba.org>; Tue, 31 Aug 2021 16:33:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=qWnM7YPAOoXvYDxBQDy2ull6nlOC2QI3Q/xmnnDOtZc=;
 b=LJzclgzuyW3STDXBcvfHrf+6ChiUotZsnk0qDNafgQv0+C2MkEVPex/uWivMGuyBan
 Xj0NNDwI1+tCyDWYUG0qdSrJrQrPsAil/vaoaT0mcxHChjtCPhIqnFCDE9MdofMcDzM/
 roN6mFvrelxM+lqy3liyOMc0zk/lK7Lfx7Xgivd3qVLglvgSYfbFYgMzgaK63wgnubvK
 +eyf1FhrbY/V7DD6edUVmT1alOHIav5hlgPxrTPTofY4svQn+BlF5fpn3vaMvLu2Qk1h
 LHcUUCMdw7KgSxksWTWe+VwnR0ItWks9T14rPxWzxu73PTYtLHwz7ywyTaIIFyL8uHZn
 l9jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=qWnM7YPAOoXvYDxBQDy2ull6nlOC2QI3Q/xmnnDOtZc=;
 b=UblaNbAyZNDa4cH7C7Ds0NJ6w1EUBSxJ4TALnbKzcPtpnVYWtV3rpSIg9LNuHf15zd
 HaR2BeUJV+2nJQ7TsXz+SU1LN/+EPtZseeHSC9rDgeufUFhXcuCwiU6b6fZf5aznzViP
 cGy4AOPofHcsnQo+CBJnoggeANyyzWB+HpQ8/OsuEMbLOoI96aU9kb6vbJKFwrQLNvrw
 3HguQr3YSqv3qA27xF7xJhRwqr/r+OaQovB82tAFTST4UncekjIY+4wTLIRE1w03KaIa
 Z5Akg/B/xXD6Hc4wBRfw34Ymk0VoEjXm2gXwpU8R90/hokXeKWZdgb/hx5w10mMRiUkJ
 0FAQ==
X-Gm-Message-State: AOAM5314wmY/zuRTIHB2iT8RjE2bouHFZ/79SR1ZGO+JJ9UvhzSXXEFq
 A2rRaRKDxByo2y6AvfLVOhKdUjCkdxZLhdopkRk=
X-Google-Smtp-Source: ABdhPJx6utr0CAYiwxdJBkt1aXRzbTRKP/E4E7Qb+lA6cgxtkWVHyFRhpj9C5+CvdXwWlP3RHpxzroriaIZQk/cmNak=
X-Received: by 2002:a05:6512:6cd:: with SMTP id
 u13mr23594605lff.184.1630452800777; 
 Tue, 31 Aug 2021 16:33:20 -0700 (PDT)
MIME-Version: 1.0
Date: Tue, 31 Aug 2021 18:33:10 -0500
Message-ID: <CAH2r5msVD=ySXysQoVvDsw+d4+2sVjybMKYSh2fBC7YDcVfp1w@mail.gmail.com>
Subject: Common headers kernel client and server
To: CIFS <linux-cifs@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
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
From: Steve French via samba-technical <samba-technical@lists.samba.org>
Reply-To: Steve French <smfrench@gmail.com>
Cc: samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Looks like a good opportunity to move a few of the kernel headers used
by the kernel client (cifs.ko) and new kernel server (ksmbd.ko) into
common subdirectory ...

Some have diverged a lot, but others like "smbfsctl.h" would be fairly
easy to make common (and has value as well, as a few of the additions
made in the client version will help the server in the future and vice
versa).   In general, I lean toward having common headers for anything
defined in MS-SMB2, MS-FSCC, MS-SWN, MS-DTYP, MS-SMBD etc. and to try
to use the "official" names for fields and #defines so it is easy to
cross reference the code and the protocol documentation (even when
those field names in PDUs (protocol definitions) and infolevels etc.
use camelCase)

-- 
Thanks,

Steve

