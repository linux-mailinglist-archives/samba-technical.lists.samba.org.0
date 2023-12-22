Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B667B81C3CD
	for <lists+samba-technical@lfdr.de>; Fri, 22 Dec 2023 05:22:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=iSmm75G3XEfUt5nKhH934BH2s1VRWm0vBr7kngXEcN8=; b=6aKnUAnXvwEzvW2e4Dvuu8pFZ5
	nk4mPcH1Ofvtf+7eVZaOFfRyuyrfNPLlUiPqI981fU4hmy87n0I658Smfc8kANMvunsS6CsQ+/UIK
	RcGSD6ecCjUEI6MSojQqCjh41r7gnznVtgOQrvfbRHRnVbF7itYzCySi/Y62MS4DdZnd677vDgEtm
	xJ6mjt5xy3lEC5vn3SfONinE8OiSNzBE8lgh5IM53oDnP01qmVXAgKt/5o4KhA4boIEqge3IJXKkY
	5R1cNTA4ioRpour7qhabIjQ69/Qf9N0klrxUF8a/iEhJXym0/idUlEMA9HMOBX9nRUAhgu0AlLLPh
	4yyKn5zw==;
Received: from ip6-localhost ([::1]:23816 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1rGX2L-008dME-Tm; Fri, 22 Dec 2023 04:21:26 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:63596) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1rGX2G-008dM5-8t
 for samba-technical@lists.samba.org; Fri, 22 Dec 2023 04:21:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Cc:To:From:Message-ID;
 bh=p5sodL8Igy7obcBSIXsgsJ/nv/zA9sYyXrIOHb2B008=; b=jUY5Uvy4ZBHadgFu1buEtBPE0V
 4q2+YI47d0RHIEE63VYbfbm3XrurxCnFBY7YH5/7GdqYtiMk2RbzwPbkH3fMu5ApGeUd+W0zNJN+c
 X8mf7942LbNAshIONG2Q4egktq12FyuMJol2yX1BXvW5h/Wlcrpf3wfdwmVJj9GobE9NCFViOmuEw
 Osu+iSIiReHzcBWNKJY38lLE0poTkUGftlFT0aDuqFyphgkfe85qy9uEPouDfFOB6Lpt0UfZChWXS
 CBbbgCLUjaQ2eVTWHUMbWdg1mB5B8j47uY6eVIBCuSvR5Sh57xxG/wa1BNWgwTutqHhBCjDOS4czk
 DWpnaItto2CPoJOAUVMnipWJbNOCd+2oeMWKA3UnkNtUMU9YwDQ1SZn9YM5/I+yARJTYx/ukV4rAk
 PaQe3Ni7RFIy3GM6KbG0dTiclnDgysxWYrMb2krfnfUTKNsMK4duxnZf1cQqddY2GfDTLGEjzMqg1
 /KFSHUQT5dLk6HKKpMbGDrZp;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rGX2E-004pnq-2E; Fri, 22 Dec 2023 04:21:19 +0000
Message-ID: <731186894254eececaadb25c14ed49d1aee4a145.camel@samba.org>
Subject: Some notes on "Implement 'update keytab' for winbind and tools"
To: Pavel Filipensky <pfilipensky@samba.org>
Date: Fri, 22 Dec 2023 17:21:15 +1300
User-Agent: Evolution 3.36.5-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
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
From: Andrew Bartlett via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andrew Bartlett <abartlet@samba.org>
Cc: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi Pavel,

For some reason this felt better as a mailing list post than just a MR
update.

I'm really sorry to give a chunky bit of feedback right as I go on
leave, I'm sure is quite frustrating and you will probably want some
clarification.  

Sadly I hadn't been paying attention to 
https://gitlab.com/samba-team/samba/-/merge_requests/1999

As Christmas is next week, I'll be stepping away from Samba mail and
GitLab.

I do trust metze to continue to give you good feedback if you want to
push this through while I've stepped away - please don't write me down
as blocking this - but I'm also keen to try and help get a good 'update
keytab for other things' solution for all of Samba, using our keys or
gMSA keys.  

For others not yet paying attention, Samba will soon have client and
server support for "Group Managed Service Accounts", which are extra
"service" accounts for a server, with auto-rotating passwords,
disclosed only to the main machine account.  No more long-term secrets
for the DB that were not so random on the sysadmin's keyboard!

They are perfect for this use case (IMAP or SSH server on a member
server), because they provide cryptographic isolation with each other. 
I've started with extending "samba-tool domain exportkeytab" with as
that is what I know and fitted in with the pattern, but that might not
be the only/best way (too dependent on the AD DC for one).

https://gitlab.com/samba-team/samba/-/merge_requests/3454

I'll be back after a good summer break, if you have the time to wait,
or are still able to continue more work after taking the most painful
edges off the current situation. 

Merry Christmas and have a Happy New Year,

Andrew Bartlett


-- 
Andrew Bartlett (he/him)       https://samba.org/~abartlet/
Samba Team Member (since 2001) https://samba.org
Samba Team Lead                https://catalyst.net.nz/services/samba
Catalyst.Net Ltd


Proudly developing Samba for Catalyst.Net Ltd - a Catalyst IT group
company

Samba Development and Support: https://catalyst.net.nz/services/samba

Catalyst IT - Expert Open Source Solutions



