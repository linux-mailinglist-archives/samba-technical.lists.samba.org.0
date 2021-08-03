Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id A8DFA3DE5B8
	for <lists+samba-technical@lfdr.de>; Tue,  3 Aug 2021 06:53:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=mHNfsOn9hBXufqgcFWsrwNkF8Tz/ssCUhmsKYanxdL8=; b=n7mMgxeRuxJd/OSlE7E9AlxfX/
	UM2bIy/vdGH0GeAeaGPquu2BEARtXvjCUVRRqM93rnRfTQ7nt9R39eFKurfxWz6m2MTp32Z8nFL0S
	JM64rBrpS4PVnUhVqhMUAmx1SGgRRFKhTexmrlwoY+0XRA1aI8SchFuK9m3TplucbXpk3mdKtBvm1
	OPKdPZWJNrs8Rketk7O70UZI+IjToibepO5Wb5ItghIAjq9797pAVFwe9nVxujhES5ib8501NLjJE
	OSNKh8ydxcwLwZ9UcwF0KlhCTERwGepNowht1FlALwMFGZp2mPbkvzJ5krxOY1lEqTU710cOmRiWf
	IuojjV9w==;
Received: from ip6-localhost ([::1]:47364 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1mAmPe-0049ef-FY; Tue, 03 Aug 2021 04:52:22 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:19130) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1mAmPZ-0049eW-EY
 for samba-technical@lists.samba.org; Tue, 03 Aug 2021 04:52:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Cc:To:From:Message-ID;
 bh=mHNfsOn9hBXufqgcFWsrwNkF8Tz/ssCUhmsKYanxdL8=; b=G773XCNhn/X0Kk+tCZS6CuKWkS
 r1qhF0rU+DV6a0zfPI97kwZ50glmd7YgBuqObcWvMUh8IszkFSuObho2btj5weZnYhJggBEbBX+aB
 S6tR8uLKPLqntBinDi1lI+FbjFnX3HyPQXeCaVUiTIWgDn9mUc0vwI7iFaMf2u41A1z02YxikeIFc
 juDwwbYuc+oCMta+wFBGmkrqD9kpqnFpQ4g85abHRpEEy812TsP+TwDYW6Sav8OttJzrEck11Lrwi
 qnJwkUrJPtU4u1Umhn9dPxmfzubuDJS3lgghx37LbeFGWAb8rI3neQQx+hGuHJOHbPVm8orRWWF66
 IXuQ4tKNzMGGw64VNLZ0V90iQXNMXlm8J/PKIvk+DcbJdFvH/UtLI/3ypQUjFaRqXMobN17+to6nA
 1TnYvaxv4MBoT4szcA5H9JisemH799EeuMjwfmTfa6bWUatiulKYk5m7+fswiVACu3yjKzir+Y99Z
 lFoF8ba6YbbcvM35TXu7lh+l;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_X25519__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1mAmPX-000KAg-9w; Tue, 03 Aug 2021 04:52:16 +0000
Message-ID: <f3d35fd592abf06db2277ad15bf22f3a9804b7ba.camel@samba.org>
Subject: Autobuild paths too long again
To: Isaac Boukris <iboukris@samba.org>, asn@samba.org
Date: Tue, 03 Aug 2021 16:52:09 +1200
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5-0ubuntu1 
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
Cc: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Since (I'm pretty sure) this commit:

commit 7e9c97ba1cd960df2688718561c4a117b79b259b
Author:     Isaac Boukris <iboukris@samba.org>
AuthorDate: Thu Oct 8 14:00:44 2020 +0200
Commit:     Andreas Schneider <asn@cryptomilk.org>
CommitDate: Wed Jul 7 15:01:22 2021 +0000

    selftest: Add test for one-way trust wbinfo auth
    
    Signed-off-by: Isaac Boukris <iboukris@samba.org>
    Reviewed-by: Andreas Schneider <asn@samba.org>
    Reviewed-by: Andrew Bartlett <abartlet@samba.org>
    
    Autobuild-User(master): Andreas Schneider <asn@cryptomilk.org>
    Autobuild-Date(master): Wed Jul  7 15:01:22 UTC 2021 on sn-devel-
184

I've not been able to push. 

Can someone please fix this up again.  The issue is that winbind socket
path is too long, which gives:

...
[117(1196)/155 at 5m31s] samba3.wbinfo_simple.trust:
--
krb5auth=$TRUST_REALM/$TRUST_USERNAME%$TRUST_PASSWORD(ad_member_oneway:
local)
ERROR: Testsuite[samba3.wbinfo_simple.trust:
--
krb5auth=$TRUST_REALM/$TRUST_USERNAME%$TRUST_PASSWORD(ad_member_oneway:
local)]
REASON: unable to set up environment ad_member_oneway:local - exiting

and

could not obtain winbind interface details:
WBC_ERR_WINBIND_NOT_AVAILABLE
could not obtain winbind domain name!
failed to call wbcPingDc: WBC_ERR_WINBIND_NOT_AVAILABLE

(and yes, I reviewed it.  Oops). 

Thanks!
-- 
Andrew Bartlett (he/him)       https://samba.org/~abartlet/
Samba Team Member (since 2001) https://samba.org
Samba Team Lead, Catalyst IT   https://catalyst.net.nz/services/samba

Samba Development and Support, Catalyst IT - Expert Open Source
Solutions


