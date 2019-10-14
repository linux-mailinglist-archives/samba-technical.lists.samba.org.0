Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 03980D6B2B
	for <lists+samba-technical@lfdr.de>; Mon, 14 Oct 2019 23:21:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=9u9pTcBD0oE0z2fimkGxo/gU93HG5JWf58GR1Mc0/fY=; b=2ifIfEWlxJPjUY/gz73HIVHXi/
	fITuMYRLCTs2G9pWyG/ITmMcBfEqULou1K3M4fZXM4+gwM7dDNkZBPIbAWadScTKPKujDpygoE+t/
	m/3juz0SBoNN4/huniCXdITxn76QSDJRXOgVqYugWEzhVB54L7LTu1LTE73L0eJKrdBOCzacwsnqS
	nKVy8pf4s3Q3V7Dmr2FxUcwpUvAfC6qrG5dYE8rKX/H9KKIhJTHf/BMjqIFn0HyN+7/RYI8syaGlG
	BKx1E2Pa1mpO5M3CG66TQ0uagxOdBi0HGhdvWzbyMRVa+U/nSFURkz3TDM1rattEMk68Lt6TE5tSE
	Y56nDkrA==;
Received: from localhost ([::1]:28902 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iK7m1-003kb7-TV; Mon, 14 Oct 2019 21:21:01 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:62196) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iK7lx-003kb0-Gc
 for samba-technical@lists.samba.org; Mon, 14 Oct 2019 21:20:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=9u9pTcBD0oE0z2fimkGxo/gU93HG5JWf58GR1Mc0/fY=; b=oIHBfCnTZYGUPzF2pQUQOrDtFN
 dJT93wY3Q8SmnPP14ui9LTpfyvMoqt8POzBm7KsOqIOyZU+EbZHL5NQtyjgzCmlGulbdyzhmPQUwF
 gYzgL8aNrTf9NOg7OrCLvhgB0ayCNGcWgfvnjL0VCBUKZRTmEQMcN1hD4sKGRKLaYqKSSYMPhRVPK
 77zejeG2pQf5IgCyPlPjf/E+ScVsNpVAuUF6pfF7d6lsmohECQBMZA3rFqhAmr6OXOQhXkGaL2fTY
 +3yr//VXURSaOMv8n231lvYLZr04l2twvfhQW/6BwPUcaAXN78oG0rypgfOD91ln4RT4Dnv87lXsn
 YE+05I9mseJmM3fwyNHsXysQNDtZnSVPedHGIu0sF1E7etjT1RqZXFsBcGxCqZ9EyamdVMspjpB0r
 tWgWB03yc292INHcORNmhz4qC0H8WDJ2fjnJmjkAAahwr2v4dOfMGKe/8m13+bHC4ReA5f3+LM8w/
 r6aqv+cjJD6jdiq2qxJq9YBr;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1iK7lv-0000F6-Vt; Mon, 14 Oct 2019 21:20:56 +0000
Message-ID: <1571088051.5274.19.camel@samba.org>
Subject: Re: Can anyone test the cross-compilation fix?
To: Uri Simchoni <uri@samba.org>, samba-technical
 <samba-technical@lists.samba.org>
Date: Tue, 15 Oct 2019 10:20:51 +1300
In-Reply-To: <54b9325c-2769-fb73-158c-8a1c69ecdf1c@samba.org>
References: <54b9325c-2769-fb73-158c-8a1c69ecdf1c@samba.org>
Face: iVBORw0KGgoAAAANSUhEUgAAADAAAAAwCAIAAADYYG7QAAAAA3NCSVQICAjb4U/gAAACRklEQVRYw81YS67DIAwkVe8FPRm5menJeAu3lmUCbyBGKqsmRXjwb8Y5aq3hl9Yj/Nh6Tu0upZRS+EdKiV+e5+mJqMKLiHLORBRjzDmbc/hlvb1QD2k3sG84+dhhvF6vlzymlNY8dyBJzUdLjAwyvaeU8n6/2WHpu/xDRkREJI8cOBMgfuRQxhj58JzzbBwhQDFGA07M6/efE0MQxDHGFvpdQHy6MUxqtU4yezRcH0B4GfbM44BWGqOurF6Omz140a0ASimJvdbwZT32XrpRh5yuwY1d0vPrdNkv91+T8uBRG8l1uiX+JtsHxPNIWE27ugwTctTdHCIiYXvuy4P7IDl0CxAzl2xgZTJwgw+g3kGaHwYh5g2sljyrjIVEq4pYBg2Kq3yXZ5WxjfO7zF9jRdXrnLcEmlbTRnNpcT0gvpTScUC2HlOE2ipAvPuJanMT+Xc0PC4dFzu1DEO4HgczaS5kOnZ4vM7zxNU+mtRyRVPDgqyX3cdx8AQCCrQnfkV9VzMA9Ryg3ek8Sgsg3QX+nbz03Og5l10ytp6HusQUwpjd1rnsksbHlhjuVGdBAbWzIiJu5MvEFkA6OkiwBO4uQL3ADeQ9b57t74+FBo1s47IqpVxqBDcuQ66r94QQJOH2ctnAf9oZtdbZYejpi2bQEveO0sb2JXu09OJJrnpil4SV5G2N6Y+1QjL+gHSKDApHJoJWF3hW2fInh6lutGW216OPRBZtRZscwyQvI+KuTj3rp4VP1VsAcTobxgDngukqm3LPgmL8A4m377Y5OvTKAAAAAElFTkSuQmCC
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.22.6-1+deb9u2 
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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

On Mon, 2019-10-14 at 22:09 +0300, Uri Simchoni via samba-technical
wrote:
> Hi!
> 
> This is a call for vendors / users who build Samba in cross-compilation 
> to test a fix for a cross-compilation degradation in Samba.
> 

> The attached fix (which involves an upgrade to Waf 2.0.18) is strictly 
> for the broken cross-answers issue. It's been reviewed already, but I'd 
> like someone who actually builds Samba in cross-compile mode to test it 
> before pushing it to master and back-porting to Samba 4.10.x/4.11.x.

Thanks Uri for taking this on and for chasing up the testing.  

Hopefully the new testing makes this more resistent to future changes,
but I would also strongly encourage anyone who packages Samba,
particularly cross-compiled, to trial the packaging of Samba master
regularly.  

We got this fix into Samba early in the 4.10 cycle to try and find
issues early, but because nobody cross-compiled master the regression
wasn't detected till six months later, meaning we lost the context and
attentions of the the original developer making the change (the waf
upgrade in this case).

For those connecting the dots, the final MR is at
https://gitlab.com/samba-team/samba/merge_requests/841

Thanks,

Andrew Bartlett
-- 
Andrew Bartlett
https://samba.org/~abartlet/
Authentication Developer, Samba Team         https://samba.org
Samba Development and Support, Catalyst IT   
https://catalyst.net.nz/services/samba





