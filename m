Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id EE12CA1A38E
	for <lists+samba-technical@lfdr.de>; Thu, 23 Jan 2025 12:49:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=4R87qwGSCke5Y+WApRReyuWPHs53mSWr0OHPGxuj5I8=; b=ampL6SQfpCqlCgFQIH9QnwGure
	PMmlxwcAfTA1VVX55EM+4Ru8utyyvRFv2PfgwQlt/2QXH/G7YnS/mTTon8PCdukFl+PDp1wOw6XAf
	DhRyQKzDogAUSImfMsuJpOlHuMNuzg3HvfDaFzq3JhrkbTr5IimxFf6M9Q/vtWi/IKWY8tfrDhdZO
	hq8yaQrCaYUCqa+rXJ8NMKGUqMtYOmIJzDmkwjQUI6+bC4kYE96IY2PBIBpGFkMIZqt0uYUTYd/eU
	RhjZ3onekbQFgk7776decclNYGS3AoZg1mA7oA0r+yYt9bu4S0/lObDmChDaxWOf1ITJUWcfwWPMn
	zEAiwgVA==;
Received: from ip6-localhost ([::1]:29888 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1taviE-009Jra-AO; Thu, 23 Jan 2025 11:49:30 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:51158) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1taviA-009JrT-Hm
 for samba-technical@lists.samba.org; Thu, 23 Jan 2025 11:49:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:To:From:Date:CC;
 bh=4R87qwGSCke5Y+WApRReyuWPHs53mSWr0OHPGxuj5I8=; b=ua+ynxd15QJRIr/WPo3qcuele7
 /X8mNNC8NnHDsZIT1AFqR3nlw2WBBoa1uCc38gR4+rlIQ10OyieXIyG/8mHpIai+FwMnSCyFb/GqE
 BZRtbtQn7A+TEIq4cNegCTsE11rN0iKs2d1JClwDaZqFV5TyzpbkDBQW34j1fidcKfiV2sHh/vkRw
 pRNLzyutwRXsvxXoi2JPpUKLYYM8HlTQX3xx7T9fQ78dnlPSOjSaZrg6kFzXnEb5JQOfLYKAI2Ui2
 0GiBx6cnMPHKQObQs6fQX7nAdHS+t8c8j4p/BpU3YfrzRhdptLjrt/Bs3Q1ti+spmSrOT3S0iVujx
 WimraG4x5CI0++NbZ4h8ieZ7tiGRQX4lAH83UWTjafp3geXkj94dySL8gYdyzTxiUanYeqC5boKAh
 FFQtVmyfqIH1qEMO/KT2l9ehB6IQf8i2CgHk0/QivznQ+M7p0RpodxWSIEI+0WRojBc5FJsjp/atw
 GnTVP7KcgrBAAQ8uQ2piqyJi;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1tavi9-001d25-2y for samba-technical@lists.samba.org;
 Thu, 23 Jan 2025 11:49:26 +0000
Date: Thu, 23 Jan 2025 11:49:23 +0000
To: "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>
Subject: Samba bugzilla server
Message-ID: <20250123114923.2f14e093@devstation.samdom.example.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
From: Rowland Penny via samba-technical <samba-technical@lists.samba.org>
Reply-To: Rowland Penny <rpenny@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>


Can someone please kick whichever server is providing the Samba
bugzilla, it is throwing '503 service unavailable' errors when I try to
access it.

Thanks

Rowland

