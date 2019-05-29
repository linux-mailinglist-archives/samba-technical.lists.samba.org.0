Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 618612E7DE
	for <lists+samba-technical@lfdr.de>; Thu, 30 May 2019 00:13:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=jQlTBOUyDFJ3CYXCznCJQejpu/MpMQKnuc6EBX/SRmo=; b=GluahXOdVvD5azBx+SSij9AeRw
	NqrTjaOqGWp2lPssfRXTlwKeGRN69Gkv3mOSkdKstCv+v2x9Qld8RzyFhEzr8yF+piw5u5ymbhhTK
	FR6uOQAa45JZa1av+wSOA8Jh7i6dOwHzQuAR56N1Vp8XTNDv0AU7VGhCtJNTNwk5yhsN7+1eGp+Ld
	R6wj4MmG+XgswOvZBr78E5UF4rW4R9lUxqXk6gyWR/LPqKDzOG8lgqAhBb9Mbp1+LIRolETmPT1TJ
	KdvmWXu5CvtYdGn/dojd/NuFE+95fuM3wP269ORvnanA9hqKRJ3Z/5gXu6uyEnRMCRNHX91IHo6De
	ff8eq+9w==;
Received: from localhost ([::1]:40270 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hW6ol-002WKM-RD; Wed, 29 May 2019 22:13:07 +0000
Received: from [2a01:4f8:192:486::147:1] (port=57486 helo=hr2.samba.org) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hW6oh-002WKF-C2
 for samba-technical@lists.samba.org; Wed, 29 May 2019 22:13:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Date:Cc:To:From:Message-ID;
 bh=jQlTBOUyDFJ3CYXCznCJQejpu/MpMQKnuc6EBX/SRmo=; b=gyyTicVP7/ZeKSE0RDBCrdSAGb
 UR9+biRpb0CrbOHFck6CfCGNoXGr4FGr2z49DBTK+wjBY3nKgbjR65oTvW0obJ+L7rynDS0KAJyQj
 /xObNLE1ECRm5SwlEcJLsYZ0xlwZrlVe0V9l6uMFvyF37sW3E7z86y2o7zu1fT5APbbs=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1hW6oa-00069r-PF; Wed, 29 May 2019 22:12:57 +0000
Message-ID: <1559167973.29502.39.camel@samba.org>
Subject: Re: [PATCH] pac-glue: fix delegation info blob
To: Isaac Boukris <iboukris@gmail.com>, Andreas Schneider <asn@samba.org>
Date: Thu, 30 May 2019 10:12:53 +1200
In-Reply-To: <CAC-fF8Qt3TH-1h0dGjGVWnROOoXMAoeL0GF6Z1dSizd0FWnkbQ@mail.gmail.com>
References: <CAC-fF8RUTx4Zvj3m_bc_tG7gMzbTy7iHyMLVnFur=6b83+pTtw@mail.gmail.com>
 <CAC-fF8SAdgU992P8tsKyGSLfi0iwcjH7vdWrw8ObqqrcZsdycA@mail.gmail.com>
 <2736033.mZseHfHTOk@krikkit>
 <CAC-fF8Qt3TH-1h0dGjGVWnROOoXMAoeL0GF6Z1dSizd0FWnkbQ@mail.gmail.com>
Face: iVBORw0KGgoAAAANSUhEUgAAADAAAAAwCAIAAADYYG7QAAAAA3NCSVQICAjb4U/gAAACRklEQVRYw81YS67DIAwkVe8FPRm5menJeAu3lmUCbyBGKqsmRXjwb8Y5aq3hl9Yj/Nh6Tu0upZRS+EdKiV+e5+mJqMKLiHLORBRjzDmbc/hlvb1QD2k3sG84+dhhvF6vlzymlNY8dyBJzUdLjAwyvaeU8n6/2WHpu/xDRkREJI8cOBMgfuRQxhj58JzzbBwhQDFGA07M6/efE0MQxDHGFvpdQHy6MUxqtU4yezRcH0B4GfbM44BWGqOurF6Omz140a0ASimJvdbwZT32XrpRh5yuwY1d0vPrdNkv91+T8uBRG8l1uiX+JtsHxPNIWE27ugwTctTdHCIiYXvuy4P7IDl0CxAzl2xgZTJwgw+g3kGaHwYh5g2sljyrjIVEq4pYBg2Kq3yXZ5WxjfO7zF9jRdXrnLcEmlbTRnNpcT0gvpTScUC2HlOE2ipAvPuJanMT+Xc0PC4dFzu1DEO4HgczaS5kOnZ4vM7zxNU+mtRyRVPDgqyX3cdx8AQCCrQnfkV9VzMA9Ryg3ek8Sgsg3QX+nbz03Og5l10ytp6HusQUwpjd1rnsksbHlhjuVGdBAbWzIiJu5MvEFkA6OkiwBO4uQL3ADeQ9b57t74+FBo1s47IqpVxqBDcuQ66r94QQJOH2ctnAf9oZtdbZYejpi2bQEveO0sb2JXu09OJJrnpil4SV5G2N6Y+1QjL+gHSKDApHJoJWF3hW2fInh6lutGW216OPRBZtRZscwyQvI+KuTj3rp4VP1VsAcTobxgDngukqm3LPgmL8A4m377Y5OvTKAAAAAElFTkSuQmCC
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.22.6-1+deb9u1 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-BeenThere: samba-technical@lists.samba.org
X-Mailman-Version: 2.1.23
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
Cc: Stefan Metzmacher <metze@samba.org>,
 Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Thu, 2019-05-30 at 00:07 +0200, Isaac Boukris via samba-technical
wrote:
> On Wed, May 29, 2019 at 10:04 PM Andreas Schneider <asn@samba.org> wrote:
> > 
> > On Wednesday, 29 May 2019 18:47:56 CEST Isaac Boukris via samba-technical
> > wrote:
> > > On Wed, May 29, 2019 at 6:03 PM Isaac Boukris <iboukris@gmail.com> wrote:
> > > > Hi,
> > > > 
> > > > Attached patch fixes the delegation-info blob to be the same as
> > > > Windows KDC returns, by adding the realm to the correct principal.
> > > 
> > > Metze points out that this bug is already logged as:
> > > https://bugzilla.samba.org/show_bug.cgi?id=13133
> > > 
> > > And thank you for all the other hints!
> > 
> > Could you add the bug to the patch comment?
> > 
> > BUG: https://bugzilla.samba.org/show_bug.cgi?id=13133
> 
> I didn't mention, but the bug has already attached the same patch
> essentially (without my terminology changes, but in second thought
> those probably belong in a separate commit).

Yes, but Andreas is asking for the opposite, that is our practice of
adding BUG: ... to the commit message of every commit fixing or related
to a bug, so we can track in the git tree which commits fix which bugs.

Naturally for Samba, this practice isn't clearly documented in the
relevant wiki page (it may be somewhere else...) :-(

Andrew Bartlett

-- 
Andrew Bartlett
https://samba.org/~abartlet/
Authentication Developer, Samba Team         https://samba.org
Samba Development and Support, Catalyst IT   
https://catalyst.net.nz/services/samba





