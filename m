Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 98D6B52430
	for <lists+samba-technical@lfdr.de>; Tue, 25 Jun 2019 09:17:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=9Qh9E61832L13iZ1DaQTobzoEgqSsQGZX5eDKXv9rWQ=; b=K/NHh14Ob+81mrOZDMl9V8AWXP
	7K9TIgWrV2GzXpocGZwLnHvpgy7VuktiRk0lGuahhkf/s9/rFS43d2yshuTz6G7FJKj45oBHUsYdO
	i7Ih8lar6K/wNhYlIkiKR2vT9GJsVStpKGv8OJuhU0tcP8TGktf1swxcNAKmveBuRE0cU3pTJsED3
	KLs5b2ACgdW65h7mVFO3zschu1CIbR5J4Uxrhj9DKuQXu2F9zrp4l/hNta+33G9uT0VAcZOropQlX
	Y5lwx0J1DPVGt73kUobjV6ePSYYEy1ncsnkZibl89vwa2DnKKCQWkKqfamttC9cynfjXhV1/yWjzT
	DkhqxZdQ==;
Received: from localhost ([::1]:42742 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hffhb-001ZGf-QN; Tue, 25 Jun 2019 07:17:15 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:12102) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hffhX-001ZGY-Ol
 for samba-technical@lists.samba.org; Tue, 25 Jun 2019 07:17:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Date:Message-ID:From:To:CC;
 bh=9Qh9E61832L13iZ1DaQTobzoEgqSsQGZX5eDKXv9rWQ=; b=m2WrlJtf9AyrGQpwO8HNRHG6g/
 9Ffq/BX/uMqxurGTMGlQuQeXXPKDx16zTTgzXDUHve/PCBa5Yf5O5SAZ1IYoFOu6s/fzSAQFnOivi
 BY+b66wZMDL7uRyFroCkMqbFbMSr2XtGVtKhTl8eWfxnbg0+E62qqXh9Wguta+J1sP6o=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1hffhX-0008LC-BT
 for samba-technical@lists.samba.org; Tue, 25 Jun 2019 07:17:11 +0000
To: samba-technical <samba-technical@lists.samba.org>
Subject: [Release Planning 4.10] Freezing 4.10 branch tomorrow
Openpgp: preference=signencrypt
Organization: Samba Team
Message-ID: <472995f7-9f5c-1001-6e30-20477a51183f@samba.org>
Date: Tue, 25 Jun 2019 09:17:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: de-DE
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
From: Karolin Seeger via samba-technical <samba-technical@lists.samba.org>
Reply-To: Karolin Seeger <kseeger@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi,

this is just a heads-up that the 4.10 release branch will be frozen
tomorrow, because Samba 4.10.6 will be released on Wednesday, July 3.

Karolin

-- 
Karolin Seeger			https://samba.org/~kseeger/
Release Manager Samba Team	https://samba.org
Team Lead Samba SerNet		https://sernet.de

