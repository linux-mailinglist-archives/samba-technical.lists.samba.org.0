Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id EB015E047D
	for <lists+samba-technical@lfdr.de>; Tue, 22 Oct 2019 15:06:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=lRxFeZI+zFKzxzhHrn6pFvSkOI2GOPt1TONb2b/W2oo=; b=NPBqyBJWmVQ2Fw/tJtYjU8mCS0
	ULXuBDymZ7zJbfH9WZTxqnUJ8o7Bbri9mY4jcYvw4HwVp99BK9jt3u5KtIjKtauEv1mMbe1hOA+hV
	Yuj02MJaQEGENTuvunLnXC91vLGukJUCzVRFWN/Qt4IBH9M7EZlz9s1o1oE1pV+gRw87HiZ8rFmZj
	oRECpoCOOFR0evGlutPAJj86H25g3Hdk2LYLIQTTIUcIeXd1EBhI5URR8sVgmdu4rGsWq5u/V4pFG
	J3TUPcxswQyezVFa8Cu01kBIspAcaXDUoapQlUKLMuJXhs5w1fbJUhglBQEsN3uA3iFNn7lxV+gtY
	dV0sTa0g==;
Received: from localhost ([::1]:18402 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iMtrk-001PWU-GK; Tue, 22 Oct 2019 13:06:24 +0000
Received: from [80.20.169.36] (port=57993 helo=mail.promoturviaggi.com) 
 by hr1.samba.org with smtp (Exim) id 1iMtrg-001PWN-Va
 for samba-technical@lists.samba.org; Tue, 22 Oct 2019 13:06:22 +0000
Received: (qmail 12671 invoked by uid 121); 22 Oct 2019 15:06:16 +0200
Received: from 172.16.1.1 (dario.lesca@solinos.it@172.16.1.1) by
 albatros.promoturviaggi.com (envelope-from <d.lesca@solinos.it>,
 uid 89) with qmail-scanner-2.08 
 (clamdscan: 0.98.6/25609. spamassassin: 3.3.1.  
 Clear:RC:0(172.16.1.1):SA:0(-102.5/5.0):. 
 Processed in 0.156472 secs); 22 Oct 2019 13:06:16 -0000
Received: from unknown (HELO dodo.home.solinos.it)
 (dario.lesca@solinos.it@172.16.1.1)
 by mail.promoturviaggi.com with SMTP; 22 Oct 2019 15:06:15 +0200
Message-ID: <e5178ae750956b030f93a1c74ba27a1026500cd6.camel@solinos.it>
Subject: Re: [Release Planning 4.11] Samba 4.11.2
To: samba-technical@lists.samba.org
Date: Tue, 22 Oct 2019 15:06:14 +0200
In-Reply-To: <F881C011-7573-4946-B05A-7952A73BF945@gmail.com>
References: <ae8f0a7928a7015d7abfa9679de2f5f4d23b4eed.camel@solinos.it>
 <F881C011-7573-4946-B05A-7952A73BF945@gmail.com>
Organization: Solinos
User-Agent: Evolution 3.32.4 (3.32.4-1.fc30) 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
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
From: Dario Lesca via samba-technical <samba-technical@lists.samba.org>
Reply-To: Dario Lesca <d.lesca@solinos.it>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Il giorno mar, 22/10/2019 alle 08.58 -0400, Nico Kadel-Garcia via
samba-technical ha scritto:
> Make a clone of the git repo, follow the notes in the README.md, and
> compile it. I’ve not been publishing binaries because I’ve lacked
> time and resources to run a high security service for such critical
> and security sensitive binaries.

Ok, thanks

-- 
Dario Lesca
(inviato dal mio Linux Fedora 30 Workstation)
