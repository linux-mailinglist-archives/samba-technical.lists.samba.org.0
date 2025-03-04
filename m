Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id D5DA7A4D846
	for <lists+samba-technical@lfdr.de>; Tue,  4 Mar 2025 10:29:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=3IDGy2zTdrOpT5Jzc7klTEbzTRNBgPER2t4EJMg7A8A=; b=TfmARu+S58HQFud0tqjmqItIus
	WzLNppP5f4xSa2p1x5SrWcY09dyfCW5yE4bvGE68s74XCabpZlpi02Uu4GtLeKL4E6mx0I08qJb7u
	H4+TcIS4I70picwyX3go5ep4qRXnQSmf0sgl69CwIYXsuE+RV1vahxbSoRJjtZpK6lCKDQi5gQMeM
	wPOdw+pZA1+irbeq0Wa68nAiqI2/t7wCB50+dsxVsW/ObYG7n3eFjsm4QYKvHVPEsqlHAA/O3awQK
	ELUBoZBs6uNmgRUyJy1c5piprCWoGenvGIWs/yp0CU3rSSaaWr/G92W0c4Tt9IeZ6ueRc8BlETrY7
	9SwViSxA==;
Received: from ip6-localhost ([::1]:49390 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1tpOZv-00FXTK-4Z; Tue, 04 Mar 2025 09:28:43 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:33112) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1tpOZn-00FXSu-T5; Tue, 04 Mar 2025 09:28:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=3IDGy2zTdrOpT5Jzc7klTEbzTRNBgPER2t4EJMg7A8A=; b=MvhE3a/MOUixrKjhV5L1x33nYi
 Mxg5DZVUC26LgjDPf0O4d6N83LvKcwtJ5/DilC/qIxtpK+xR+WhRHPYeqcdrvTHO1ZbHk6ibTXHjF
 h4ism9hv+pr2yPP7WSW/kJeiXMHXVXWmvmAZm/1qNXMBEbrQLJqBbreNPdZwNcIPNk5hD2osnXlaf
 xWwaoMgrKqaZ2aXYhIzoYJiRZFxhlefESmqXaOpP5+UfN5rnxfKTYj9T7+Y6PVOio5y2GOv+S18we
 VcGCrsHPYzLrG4NPzx2F5spgMXWaIt6QTMzJ6DbvKEudFFPpz2nQvyihBB2NrVuHeEkEUtmPPZ9Hm
 grtSgEiBKfl6KQgmTk+hCOVvxwgOx7tAdPY+8HICXAwgT1twjbQcKo/73vWPjbtOfiL/X3iIiidSx
 dkozYlnOWLfnD7xohPWWVP9FvWFYurdtJ1cgnCok3s026G6AxXAu/zDDoYJLp7IkQU+6dD6yFJPJo
 u1fIkY0THkPLiObxVJPUEkJ5;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1tpOZn-003HjM-0F; Tue, 04 Mar 2025 09:28:35 +0000
Message-ID: <0f913f56-25f4-4ed0-b608-68dfe4762bd3@samba.org>
Date: Tue, 4 Mar 2025 10:28:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US, de-DE
To: "samba@lists.samba.org" <samba@lists.samba.org>,
 samba-technical <samba-technical@lists.samba.org>
Subject: SambaXP 2025: Agenda Now Live!
Content-Type: text/plain; charset=UTF-8; format=flowed
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
From: Ralph Boehme via samba-technical <samba-technical@lists.samba.org>
Reply-To: Ralph Boehme <slow@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Dear Samba users and developers!

The detailed program for this year’s sambaXP on April 7–8, 2025 is now 
available! Visit sambaxp.org for all details. Look forward to a packed 
two-day schedule full of expert sessions, technical deep dives, and 
invaluable networking opportunities – once again held on-site at the 
Hotel Freizeit In in Goettingen, Germany.

Highlights at a Glance
----------------------

* Keynote by Mirko Swillus (Sovereign Tech Agency): Get inspired right 
from the start as we kick off with exciting insights into the 
open-source and tech funding landscape.

* SMB3 POSIX Extensions in Samba (current status) – Volker Lendecke
Azure Entra ID Auth in Samba: Introducing the Himmelblaud Daemon – David 
Mulder

* localkdc – A general local authentication hub – Andreas Schneider, 
Alexander Bokovoy

* SMB in Windows Server 2025 and Beyond – Raymond Wang, Genghis Karimov, 
Dan Cuomo

* The Rocky Road to SMB3 Directory Leases – Ralph Böhme

* Unleashing authentication for the Linux CIFS client with gssproxy – 
Daniel Kobras, Michael Weiser

* New keytab generation – Pavel Filipenský

* SID-Filtering, Claims Transformation and Selective-Authentication – 
Stefan Metzmacher

* A Deep Dive Into OAuth 2.0 – William Brown (pre-recorded), David Mulder

* The CTDB Report 2025 – Martin Schwenke

* Accessing remote storage better from Linux – Steve French

Looking Beyond: SMB3 IO Lab
---------------------------

Immediately following sambaXP, from April 8–10, SNIA will host the SMB3 
Interoperability Lab EMEA, an exclusive testing and collaboration 
opportunity that perfectly complements the conference program. Don’t 
miss the chance to link theory to practice and enhance your SMB3 
implementations on the spot. (Additional registration 
needed:https://www.snia.org/smb3iolabemea)

Register Now!
-------------

Ready to dive in? Visit sambaxp.org to view the full agenda, secure your 
ticket, and find more details on both sambaXP and the SMB3 IO Lab. We 
look forward to welcoming you in Goettingen for an event packed with 
open-source tech, cutting-edge developments, and a vibrant community spirit!

See you there!
-Ralph

