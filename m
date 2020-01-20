Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id BA9EC143456
	for <lists+samba-technical@lfdr.de>; Tue, 21 Jan 2020 00:01:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=VuZ6hapxPep3HZnWLpRvSnv3uxabYjC8WyxKH6ihO+4=; b=wJK2fE8vZGUF5wXTaMKv1rfEXK
	GmMavWRzQHVtbhdcvEtUBwMDhlukaoACjL+ZuhfMDmr9hNdkn+XhhPHfWuMNh05Zpb37KnuM9p2n+
	UUnKdjvE/Zz1j4GgLSnCLEvlNS6bcwj6UGidsoymbyo4FTxqc8jSx029Itakw3b/YB08baUMpe8A2
	jAhHy+/JktKOwkihJizhc5pakIjYE5lrkaKqznENva9B3BIVfliBfIwYExYvZKcjGRmmejNsgDqK7
	DX2lb/H85aOox9pNVdXpVcF9sIIQxTGxLi7JwOcce56CL3r2CzYONCCq2MV0ZA2wMDFSeJcbz3YZa
	poxDoubA==;
Received: from localhost ([::1]:37814 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1itg2L-003xMR-Gj; Mon, 20 Jan 2020 23:00:49 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:49224) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1itg2D-003xMK-V7
 for samba-technical@lists.samba.org; Mon, 20 Jan 2020 23:00:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-Id:Date:From:To:CC;
 bh=KCULkxJYjfIjxEAz+2Ps2uRGVAb2Tk2kwWG5D+tA6t4=; b=X3HyDOyxsJeQ9+8TvoG2tgpsPj
 vf9L7IX6tlN1w9dzniz7QsRAuSGbVXRcKrcmP9LOgJ/4QrButc6g2yQRSH2XSvtV1AxgFlA3p5XYO
 duW/FBt7fRyR2k+lXtmvEULvDyY6BXb8KXgohIoNZ19k1VwA35b/vnTTCM7MUq7IOuJPa6Y65KUi3
 o9dWHbGmw6ZtTh1tFu1ayFrRwOvydURgYiMhefgmvipp6G7jhV44yDlp3ucI/AhRADrrETHvn0nns
 L39NQP72WYDXzqmvVtqGJBJ1iJgucNajb2kocaSuhDQjWykYO8N0doCCp3O3/xH9CXCudV8llbV4q
 5OCpOwo4fyWHAQi3KxLYUSbortGM08iJJtU6sHXHqfeg/6K4QfTrILetLQY+WZ4hn2iCdLuRC2ca4
 3c78mDzEHBkIVDlSGPko6e1Rlxs1GZv7YGvDWMuLvQuynrbrSJ3bUarfJZfOqxut3SZxTgJiYqoOE
 cMkn7h0PDU6RC/pLcknPnN7z;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1itg2D-0003ZZ-HQ
 for samba-technical@lists.samba.org; Mon, 20 Jan 2020 23:00:41 +0000
Received: from localhost ([::1] helo=hr3.samba.org)
 by hr3.samba.org with esmtp (Exim 4.92)
 (envelope-from <github@samba.org>) id 1itg2D-00FjZ0-Bk
 for samba-technical@lists.samba.org; Mon, 20 Jan 2020 23:00:41 +0000
MIME-Version: 1.0
Subject: Re: Update gpo.py
To: samba-technical@lists.samba.org
In-Reply-To: <gh-mailinglist-notifications-7cbc67a5-3baa-45ba-be96-ccfa955fbabf-samba-123@samba.org>
References: <gh-mailinglist-notifications-7cbc67a5-3baa-45ba-be96-ccfa955fbabf-samba-123@samba.org>
Date: Mon, 20 Jan 2020 23:00:41 +0000
Message-Id: <E1itg2D-00FjZ0-Bk@hr3.samba.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
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
From: Github bot account via samba-technical <samba-technical@lists.samba.org>
Reply-To: samba-technical@lists.samba.org
Cc: github@samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

TmV3IGNvbW1lbnQgYnkgZG91Z2xhc2JhZ25hbGwgb24gU2FtYmEgR2l0aHViIHJlcG9zaXRvcnkK
Cmh0dHBzOi8vZ2l0aHViLmNvbS9zYW1iYS10ZWFtL3NhbWJhL3B1bGwvMTIzI2lzc3VlY29tbWVu
dC01NzY0NTQ4MzEKQ29tbWVudDoKQGxhdXNzZXI6IHdlIGVuZGVkIHVwIGZpeGluZyB0aGlzIGEg
ZGlmZmVyZW50IHdheSBpbiA0YmM0ODFjNWNiN2Q3NzJmNDczMTcxOTQ5YTNkNTIyNzg4YmI3ZGNm
DQpzbyB3ZSB3aWxsIGNsb3NlIHRoaXMgUFIuCg==
