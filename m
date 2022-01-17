Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 3192A490CA7
	for <lists+samba-technical@lfdr.de>; Mon, 17 Jan 2022 17:51:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=xzgw7u7RnCnponOh/5qNT2zaDGJJ7kgSLKtgh3/ZRu0=; b=LIrj2YgHm53KA5AMwsb6DxvYtG
	i91Pzoc65H/1UnSvq+IkorHyhtRlqi349twMMnB1alFrkUuggGWDJBhznzL+Ygw20yYQaVRpAmrI0
	V4DWRplOO9b/PWvnEVr5TVhJdAZ1djyHaMi7pTbP8V7raqKGuKa7AhLFhCHfcJVz/qxXxxrOXPBMt
	QrL4WZYzbSgrSJjdjIGQuU+pR51welwY2uC8WRBYxLEGHWFX4fSvj0aZ8yBLwyu+LQ0/msu1QX8M9
	oOxXIdpBfjsuDLPOIDJ9NU/qxxQRe+syK0F6dwYREBCR7AeyBqoYd6Ye5yUo+sL6FzwfpDsutNhMn
	Go55yebQ==;
Received: from ip6-localhost ([::1]:56406 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1n9VE2-009DVi-Ce; Mon, 17 Jan 2022 16:51:22 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:55078) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1n9VDx-009DVZ-BQ
 for samba-technical@lists.samba.org; Mon, 17 Jan 2022 16:51:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:Cc:To;
 bh=xzgw7u7RnCnponOh/5qNT2zaDGJJ7kgSLKtgh3/ZRu0=; b=W4dMJTD8gPdte0mQHItE8Xt8IW
 It0Bh085i5Q7A8GE7LdxylHnEsBVQdgqfrg/KYHEvBDa/c/THhMK/CvKAXfYB4EMSJ++q6dbJytTC
 r4gf3efk1QgGwKkdZVe9MuZOFA+cLj0frVBAOEq/KJseLndP9Uw6HHDZ6VSXsgOz0+q8hxH4GJsJz
 /2ugyVWw93qKoBwF8+9zhAzFkKRux6JVl+lhHxxwSBHDE5JD/hnzt/BkL3+vHhMsaCceDewezS8zt
 v6EA7Cv6GLrdSjLGMoWAWfNN9zhXRjEkZxDakym/DxI1i4oVl9WtN9FykHUJLxRqugRQ4bxBkh9ax
 P5nRtSqRvZMLSjwKfk1v5eOaQrXNuRWeJVrZdHBAOVnxHQ13WpvjSNtPz5IVqHc+GZaXhK80W5rL6
 YwUOG5+qA0i25UaElXvSPEmtW83eVscOAxTzllu6MvqNkfUUagVDW4gYtD74+CTrk3ViYz1KezbET
 YQUS80kjeGSq0RsVHAKeYRH9;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1n9VDw-007hE3-E8; Mon, 17 Jan 2022 16:51:16 +0000
Subject: Re: [SCM] Samba Shared Repository - branch master updated
To: David Disseldorp <ddiss@samba.org>
References: <E1n9RtZ-001bnc-LI@hrx0.samba.org>
 <06661a89-4284-9bbe-ac6d-59e21d813b10@samba.org>
 <20220117174039.5854dc89@samba.org>
Message-ID: <b04a201e-868b-a3f4-2184-28616b6c68aa@samba.org>
Date: Mon, 17 Jan 2022 17:51:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20220117174039.5854dc89@samba.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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
From: Stefan Metzmacher via samba-technical <samba-technical@lists.samba.org>
Reply-To: Stefan Metzmacher <metze@samba.org>
Cc: Andreas Schneider <asn@samba.org>, samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi David,

>> where's the related merge request for this push?
> 
> I pushed directly to autobuild following Andreas' rb+. Looks like I need
> to refamiliarise myself with Samba's Gitlab MR workflow. I'll make sure
> I go through the proper process next time around, sorry.

Ok, thanks!
metze


