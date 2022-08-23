Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 1833459D0B7
	for <lists+samba-technical@lfdr.de>; Tue, 23 Aug 2022 07:51:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=1yUnadU1vNhrayWrxdkZNPiBVeOQLJwbYfU5xi/mZr8=; b=g6lS8QFx/5brou2oA9rSkv/zpK
	wfPJi5kLcY/BbNNrSOMHG3ttCakEwvOHpO54TVPNyyhV02JAH948EMzbPn8VyCiK0lI6cpB6Upn2W
	99l/skitMGWKehLDRMkiCNmVVuVEj29+MAoawtSx7dRoyXiUq/FbzGRYobKnsXOuL+1XoYthVE472
	cSJZOxLpr2AiGKWIb30Q67l02OF6lIDS5MnwIlrfgZlRishZ+ii5Q7050pOw8Vj7BIlalkuFl31l7
	8Rla4FMP4zBQ97P++epBz+80gQRIXwxE3Ftw7O3vPW3/9Q3qjlGDgn9TmhBrJ3UWKRcz659g5xyv2
	A9SO6UhQ==;
Received: from ip6-localhost ([::1]:41256 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1oQMo3-001to6-5w; Tue, 23 Aug 2022 05:50:31 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:46030) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1oQMny-001tnx-EQ
 for samba-technical@lists.samba.org; Tue, 23 Aug 2022 05:50:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:To:From:CC;
 bh=1yUnadU1vNhrayWrxdkZNPiBVeOQLJwbYfU5xi/mZr8=; b=KpoRT6HFXzTP1eIDsWaOrg8F7b
 WeleTcq4nSvKYAHSa3xwHwxxYP2nEPiJbtq1BWIuJP50ehw8bHdCorhrovynUCZ1+i6uVd8AhySKw
 TJtkyF+egD69OwIitXaMfVPbK9WalIKSq0BUvi2B04ud+zDUC8QQmD0MKO9gOTrRGSfnf+wLW61us
 GjgINypwuNQSjHot9rC6yhvFBC8glxkFQkCtacdgNTt9NLeHPYeeH884RRK76c49XJEt0iQpUjNS0
 Z0FfBM3Z+TOz1XjBKlX0uNWvB0ormNmsUXp9Vmkh4oW3ncrnMGPDS4cGTQV2CwGq8+3aHNI0v+Oxd
 kxiYhY+al/swou7eSfA8qey9BxIrs0LfdepoFCi9MNyt2NCgj3xgONntbZaQuwQDraP8PfxfSXN2M
 EYQQHguJB4Evi9ddAtqQqMGqegOA7WqNGx8N4eEnK9YzTTFBINFTEvvoZAGBPOXVsEss7PywjHelM
 1J3pg/mZkewkCN+UnAd3acnN;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1oQMnx-001LAu-UG
 for samba-technical@lists.samba.org; Tue, 23 Aug 2022 05:50:25 +0000
To: Samba Technical <samba-technical@lists.samba.org>
Subject: Samba and ShellCheck
Date: Tue, 23 Aug 2022 07:50:24 +0200
Message-ID: <4766256.31r3eYUQgx@magrathea>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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
From: Andreas Schneider via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andreas Schneider <asn@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi,

for Samba master we have ShellCheck with error level in place now. It will 
check that our scripts are error free!

The next step would be to move ShellCheck to warning level and this will be 
quite some work. But first we need to discuss something.

If I run ShellCheck in warning level:

./script/check-shell-scripts.sh $(pwd) warning

The warning I see most of the time is:

warning: In POSIX sh, 'local' is undefined. [SC3043]


Why do do we use POSIX shell (#/bin/sh) for the majority of our tests (we also 
have scripts with #!/bin/bash)?


Best regards


	Andreas

-- 
Andreas Schneider                      asn@samba.org
Samba Team                             www.samba.org
GPG-ID:     8DFF53E18F2ABC8D8F3C92237EE0FC4DCC014E3D



