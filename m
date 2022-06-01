Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B1EAF539BB5
	for <lists+samba-technical@lfdr.de>; Wed,  1 Jun 2022 05:33:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=95WD5AAJeh45+QibAmbjjwr0Cc2vhWX28M7b8fp9jjw=; b=bmphFxQFBijKDrCy6i3y7lmqel
	C4BlErmA0Sw/GVY4iXFMY4R/M07lds7wwePpfnABkYWgIiK8RBYORoaCUr5GnxL864kN6FST7IUNK
	KKFzJMp5yK2NjwPGQfXtSHS/jHUrqP1nt8U5h9nlK9jQsa1mTTgDSm5s56CZ4vi6ZQu2xVTOIQDt/
	R2rTkKJlxPfUE6vkbZv0pYfjUWtLPrdmOfQrMelfnTAGcYneV1CVRXcmR4KjpjqkGRg1iA8fvBDkk
	ebjkqac4cw4B3D/uJrbZeTqYxR5DJaubraB1L3/dNtijPwuF6mq/Dd19rEsB8xzBmJ/SQ/I6JcAj0
	Qx9FUWRw==;
Received: from ip6-localhost ([::1]:56768 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nwF5p-005sgh-Hk; Wed, 01 Jun 2022 03:32:21 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:61926) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1nwF5e-005sg3-C4; Wed, 01 Jun 2022 03:32:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:To:From:Date:CC;
 bh=95WD5AAJeh45+QibAmbjjwr0Cc2vhWX28M7b8fp9jjw=; b=q9FK2FLNQRfacbP1maT7Ewe0yW
 cXYmP4aJxwk6OFt5LnJCHj7UIPentNBYS8AC++13D2+Su0S6bugK2gVwTvGoFVwUm545p9HUAhdh5
 I2euPJhmkyhIml43SpG9o100PCTzlxajdWwrgq9OvffTPdDnP2voFkxlg2TjYom6/LmTCSjIK3lGO
 UAQqezpHEDv268KtrpoGGBeCI7tiXf0V509QBI5DPJktr3YyXut1jbksDFhHa9MoSIDIauI2MpJxO
 cXNxBh01FN/hJJ8NehyolZG8f6JMyHK0LuGRLp7WWD0mNuBra4yHz36xZQhMRZaJw/UU4Jlt/UkW2
 PHCbGIPoDUl5SuroQCeUS/6WBNkxPPss8LlxkQPma5bMVn2ct3ttRNhxfU4Faa7SWEUVR1nDFdtSU
 yVLML5//eI3lHR/URtYzzWL4JLhL4hDf/cb8Yo54ej81KHYmH78ovDZjVJ61MJDhudMG3LxLBRjwu
 mXF72tQP8hDiQCZreARXjmI3;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1nwF5d-003R2O-5L; Wed, 01 Jun 2022 03:32:09 +0000
Date: Tue, 31 May 2022 20:32:04 -0700
To: samba-announce@lists.samba.org, samba@lists.samba.org,
 samba-technical@lists.samba.org
Subject: SambaXP Conference starts tomorrow ! Virtual event, free for all.
Message-ID: <YpbdtE/5bjWfVfir@jeremy-acer>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
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
From: Jeremy Allison via samba-technical <samba-technical@lists.samba.org>
Reply-To: Jeremy Allison <jra@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Last chance to register for SambaXP.

https://sambaxp.org

Starts tomorrow at 6am US Pacific, 9am US Eastern, 3pm Central European time.

Virtual, and free to attend with registration.

Speakers are from:

Catalyst.
DDN.
Google.
Microsoft.
Red Hat.
Sernet.
SUSE.

Hope to see you there !

