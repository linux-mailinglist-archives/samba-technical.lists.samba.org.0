Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 1117119F0D5
	for <lists+samba-technical@lfdr.de>; Mon,  6 Apr 2020 09:35:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=We6yRxGPhmy+C1yunGiFx7pmq+4fBXwA3gogF3RbgAU=; b=k3pmTZcmWdyBXOrr60yOCX6K0J
	BsUMe7VgNQlefk/dEYL5JsGMD+iD74yRVaAuh2a5fX/YS0XYtxSXtB09rn0EfrVjysLK5FwCT8oa2
	P0gZtgNm61ZDAhmfrOQTF2Z+1+4FDNYlLg/k8T+E2fi7TDm5yH2HDal95jfVWcqeNiZmMwAFmuCpA
	bpbll9h3SYgPDaYRWajAEWQnUIRVdWPful2AhAmTbBuCj3bWznwC9BJyA8AuID+Vw8krSaPv2vov3
	c072DCTnp8qnKkWt6sa1FlUDfK08q2mMGRK02c9iSbI8Lb/IPwqfdm3LWjGpwst9/awp/TtK3MNrB
	vpHl8B6A==;
Received: from localhost ([::1]:22760 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jLMHu-003Xkn-2V; Mon, 06 Apr 2020 07:35:18 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:42638) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jLMHi-003Xkg-Pl
 for samba-technical@lists.samba.org; Mon, 06 Apr 2020 07:35:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=We6yRxGPhmy+C1yunGiFx7pmq+4fBXwA3gogF3RbgAU=; b=s/p3wlsga3nsksQg61m4E7x8rJ
 0ifwaIZV3bgjRJWWtCHBYZ4A14lBcs1u9lfMWhC9UfjtV112rfUA6+zpObdDvLLxpNQVbe6AqkJrC
 j3WfQYYF/GtOiJuWQbV2AZffiK2J5VzIYdGgLOaTUsdgyiXTVDjVjhLNfnHsKShbst+kZ+od2/W9q
 L4jTnsl90zd2xpLWA+cADJ2aDOLgooCbh3xrGIlBO5w2x3lWEDFVaBV/QEjjM8sanOASda61ZMsZW
 Ymw/6BW80tFK0vYuFbimH7jBQntyDlit4qKyGruM+LyQ1dBYFEeqHvI312Mf2dRbwwmuHfIZI99Yy
 fXB4tRExsqz0YKKpIur06zzfN8CleyxstKAdDmfKlfYAerwB0edmeNbvbX+sr+fNyXIIuIV8eD7Dn
 RWBbRcQMDHCY34IQqvPITG4IrkoXV2oJqlmkgKuevtQ+OoH93ufbiNz1MSZDerk1dna89NLp06FSO
 9Bq/7olrlTuZKeet+vgscbrK;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1jLMHf-00073P-9Z; Mon, 06 Apr 2020 07:35:04 +0000
Message-ID: <4ad69f25787587db5f342ca556c76873d879dafe.camel@samba.org>
Subject: Re: gitlab: mit-kdc on fedora 32 with krb5 v1.18
To: Andreas Schneider <asn@samba.org>, Upstream Samba Technical Mailing list
 <samba-technical@lists.samba.org>, Alexander Bokovoy <ab@samba.org>, Isaac
 Boukris <iboukris@gmail.com>
Date: Mon, 06 Apr 2020 19:34:55 +1200
In-Reply-To: <1623918.IrRfrNb6Vh@magrathea>
References: <CAC-fF8Ry1imc+yxKpwi4qpZsjbzLejeRX5UB-LAvGM3=yM0A5g@mail.gmail.com>
 <1623918.IrRfrNb6Vh@magrathea>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
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

On Mon, 2020-04-06 at 08:43 +0200, Andreas Schneider via samba-
technical wrote:
> On Saturday, 4 April 2020 17:12:38 CEST Isaac Boukris wrote:
> > Hi Andreas, all
> 
> Hi Isaac,
>  
> > Any idea how to make the mit-kdc build run on fedora 32 with krb5
> > v1.18 in gitlab? It looks like it currently isn't.
> > 
> > https://gitlab.com/samba-team/devel/samba/-/commits/iboukris-test
> 
> I guess the way would be to add a new target in scripts/autobuild.py
> 
> then duplicate the mitkrb5 entry in .gitlab-ci.yml and use the
> fedora32 image.
> 
> https://gitlab.com/samba-team/samba/-/merge_requests/1216/diffs?
> commit_id=43c943a01a84d810f4784b5f2d1c5fdf52fa382b

Can we please just have one OS for the mit-kdc builds please?

If Fedora 32 is the best target for this development work, then please
move all the MIT jobs over to that OS.  That will also avoid trying to
develop for multiple MIT kerberos versions. 

In the medium term we need to be importing the known-to-work-with MIT
version into one of the docker images, so we have a way to patch it
rather than waiting for changes to come via the distributions.

If that means not running it on sn-devel then that should be OK, in my
view, we have already stopped strictly matching these environments. 

Andrew Bartlett

-- 
Andrew Bartlett                       https://samba.org/~abartlet/
Authentication Developer, Samba Team  https://samba.org
Samba Developer, Catalyst IT          
https://catalyst.net.nz/services/samba




