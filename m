Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 38458602DE1
	for <lists+samba-technical@lfdr.de>; Tue, 18 Oct 2022 16:05:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=YIHzYNwE/2Z2yoS8ZgPWlpo4W1ku5g22fEikFVW7fH8=; b=4LM4UkkMinxwKbKNUGinx3ss88
	1G9El8ub2DgiKj+LwO34EaMxqKW/2JooxcBG/q/xdAtk+yo3UvHJEVWyfVcr2KyLAtyiWeqEHyXBu
	aooB3LmvKtsTcG3P/44CxX7N7j1Q2onbWSba6+sowmGPiGwJETX8ZovLb0NE21Z+1k0VzfzNprbn3
	N/CLSPDYLrCRc/kG4nocZ+I291PGiR0mkJQCUSsg3XWyqE3mJqcEIUVRFcAf3X0TQc9LQsajMGxeu
	V73YZjAI1EsH4pzeoJc/+ysTERo+AQoTomt/QniQSsTklxzPlZXrgS0kG4xkiBneKxL9AQ6HUMWrk
	ZJdvxViw==;
Received: from ip6-localhost ([::1]:62846 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1oknCs-003M6s-Mx; Tue, 18 Oct 2022 14:04:34 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:54018) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1oknCn-003M6j-I4
 for samba-technical@lists.samba.org; Tue, 18 Oct 2022 14:04:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=0/BGWTk7NavrnTU+ZC5jaiFW2FKDv9TJi+1zt/ovPOo=; b=g9e+tGEhT+EqQCDTTmSmnS3tu1
 A6qraMEteLH7svBulg3LYYu3fphmVpG88ujQ4K28M/zvLiMgSeTDb7ZlEk6rVZ7SIlZMHak/UmXpx
 VJarHKOv2QdaE1Au5AkVtQemskk7QBZF6jr29KW5wUcFnhJ0DL/wjZyw5WYh8o4f8xNRYhIBJZa0s
 5iMWv5fS3kSj1P+z2YDYHU2ogmqChAbJJMNs48KmMWmkgfdNO3Q5g4yOpy0MunUWAKnDg/t6Oqv8p
 R1gA3Wa+p547lXRm/6DZW9W4En/xPPZi/mWgaykstFiyiS/+W5x49anyOoRHWywYsgdWmPdLY2w50
 QoA6tRDl7CCIrH8be+UEs9J6Al3kTxSA/nERYZxMnO7kMJ5e0xm5D5MwYLOU1PYsYhJiFeJ/JAesK
 IWEXXd8ODj+bZjw67KT/l7u2d9b8NhqxE9Xo7LLktizofOi/tnuYHtXEXcXHtxBE3mNz/1V6MEeFl
 CECv0DgGE4kIVaLlqxQ3wojE;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1oknCm-004kEj-L8
 for samba-technical@lists.samba.org; Tue, 18 Oct 2022 14:04:28 +0000
Message-ID: <ac391151-b0fb-7113-f759-b7ab2899ffeb@samba.org>
Date: Tue, 18 Oct 2022 16:04:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Content-Language: de-DE
To: samba-technical@lists.samba.org
Subject: [Release Planning 4.17] Samba 4.17.1
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

the 4.17.1 release will be brought forward to Wednesday, October 19.

https://wiki.samba.org/index.php/Release_Planning_for_Samba_4.17
has been updated accordingly.

Cheers,
Jule

-- 
Jule Anger
Release Manager Samba Teamhttps://samba.org  
SerNet Samba Teamhttps://sernet.de
