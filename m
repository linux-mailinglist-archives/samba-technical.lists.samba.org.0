Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B3431516DC5
	for <lists+samba-technical@lfdr.de>; Mon,  2 May 2022 11:56:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=pDPavot+wkgd0t2K0Xt0MzbvxKhGyHXE87t2PeZ/UHA=; b=ZLgE5W1dbRZ9GlFsX3qVnKQbDS
	xw3O2v75kQe6nZPnHKct6zvK1UXD5l+PD3KBFri6Ss4j9/qnS/TgeaugFOFWY6tI7Kq55QUu1rquv
	Nrj5GlpDCId4A0N9aSiqtDicIUvAc7M8Le5peFNnO+ptvIu9SjGycDMNOH+tM/JnxRQb68hll+rny
	FOkFNBD9tHODyEjEr0xJ79hFmRlxuNL03D4cyaOf1SYv6BtLvNZLst1h/k/Pyzhi1XK/kbLRpDXuJ
	db5gCCxcaEkh5wz3Neguk1XjB5i3H0O897RkVwmdi9hUeykNIG5iA9OyINQ5jCmcgpNs20dC3FHMV
	kJf/ZEww==;
Received: from ip6-localhost ([::1]:25410 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nlSnU-005WAK-LE; Mon, 02 May 2022 09:56:52 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:50276) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1nlSnM-005W8Y-VT
 for samba-technical@lists.samba.org; Mon, 02 May 2022 09:56:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=qaTPleGNOodprAMbQkzwiljbtWCTkhnrcSzJiT2OIJM=; b=P9grHQDG0HzMv1OhAZq02ndBcI
 hrx4wo4SXelMiqlSR7vFbN0jJ4KQDsgRiCQb0fRo+W5pB20foU3fw+eF7ZaYh8bgNKuGKuHSrvVxY
 mlYON2lqIylRr/Ip3kIv0wx6GAxFTHe5pmQ7DKxdDoAU5IvQ6gpWF3X1Hfpv1eSr0j0Mt/ipnjliw
 HhFkJMfWniBwVY09uuz6AoI/pCvVXRMogwUEBGG8IY2eZQnhedA4RyplXOOG0EsG7F/tPlVawfhXT
 V03jZnJvLFDbQyoyhOUqM4i5gELbQeOIMgnOtpPDzWwrJ3grL8SB79R47vlbFLszFzV8jM7WIGDOm
 h6L6yffrJdXSEfUgFsWjOpRVAPwqgxH9t8WjZXTT/crBYaGMKYcGD2bVgrcGt4esVANKvBlIzEWFC
 YyIgntbDaaeYMorsVv/vMc6F14iqCg671vTlz+n5yTV1eH5O5c9So7XfkhWfpJI3EvvWfwgcgyHSA
 l/mfCCHOS83NUdvNpQMUME9H;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1nlSnM-003bA8-NC
 for samba-technical@lists.samba.org; Mon, 02 May 2022 09:56:44 +0000
Message-ID: <b913b434-e703-b318-86dc-879fd2dd615e@samba.org>
Date: Mon, 2 May 2022 11:56:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Content-Language: de-DE
To: samba-technical@lists.samba.org
Subject: [Release Planning 4.16] Samba 4.16.1
Content-Type: text/plain; charset=UTF-8; format=flowed
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
From: Jule Anger via samba-technical <samba-technical@lists.samba.org>
Reply-To: Jule Anger <janger@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi,

Samba 4.16.1 is scheduled for Monday, June 13 2022.


https://wiki.samba.org/index.php/Release_Planning_for_Samba_4.16
has been updated accordingly.


Jule

-- 
Jule Anger
Release Manager Samba Teamhttps://samba.org  
SerNet Samba Teamhttps://sernet.de
