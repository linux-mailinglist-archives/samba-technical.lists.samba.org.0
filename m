Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B276019E5FF
	for <lists+samba-technical@lfdr.de>; Sat,  4 Apr 2020 17:05:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=h63Opojjt6/H4Pmxot3nMrn8beGWGyHhTIee5eAsNhk=; b=yJv8xplr+HqjYGTHuUs1Fr1WJG
	E4AiwhNSa9Li8greJ6WLBi09GOGxecgxlbfKBuuOgAal5oP9bv3t/Ila+1+DSawPgjOW7ESptWOtZ
	vK4L7o/GJ/RJ70U5xp4+MykR754lMFv/1XwBQU75ZoKHxxxfqqznyJ6YFqdV1h3cA1NbqE6lCtY3x
	eL1kCmmurT4KXSUq3qWkYZ9Eyr2hnxY4cs39XVl+EJ+aI6kEH92sey/oID3WXSxkij4AtgREsiQXM
	lh5JmzApfm+oPvzrr27assaQDIMKZy/fG/oAFRoCUuBkMW926mllA5xC1qZHLNh4QGn1YNZZHHpvY
	Lj1xrYwQ==;
Received: from localhost ([::1]:38098 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jKkMs-003JKz-Do; Sat, 04 Apr 2020 15:05:54 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:10356) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jKkMn-003JK5-0G
 for samba-technical@lists.samba.org; Sat, 04 Apr 2020 15:05:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-Id:Date:From:To:CC;
 bh=4QKJQPaKocgkam0naCw6SRBeAXZ5t29LWP4/Mr4ztnI=; b=FFpMInk6gUJ07pZzwY+xzxRXIX
 HfNbkrg9QLs4jDJ+RBJou8GPwYdcgf5rAeOsePelBLivhlKHKtdFtwCYVPQHyfvW+n9ghi/OupYtp
 qO26UYDiUcOVrfWFXscwA0WNKKkwSKfT3YzKGL0BOkrtBSDZKh9aCx/GuycsaQ9YRZhsFO9Lm7a51
 oumO+o/PCuSKgWjPlqFjyxFtV2ileyb4yWMdBpxSpI36M9/IZCfAOTvTGLvkGepSJ1ORXc+GIuGDm
 il7b/dlrGSkxHwGMzdIHix5bFsl5i9v4ifMY2O61jMTLV8Khv3ndATNbRo8QJobQVGIJtcYcCilfk
 2EdNa4WulDYJNlc1omkD14PvYcgu/xKX6xlCG8oLrL1Q5IBYavOVztoJs/g42fffGNizIuZp3yo+z
 ruIH+aPrzDMD1bB5aG/Cdln91vnfpT44lqXZR/DyLFX22BlBkBcTS0y1fC4km4HPmlBGAIKtUY3RR
 aUBRCn1GXkKQo9tP1X2dK78E;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jKkMa-0003PG-TH
 for samba-technical@lists.samba.org; Sat, 04 Apr 2020 15:05:36 +0000
Received: from localhost ([::1] helo=hr3.samba.org)
 by hr3.samba.org with esmtp (Exim 4.92)
 (envelope-from <github@samba.org>) id 1jKkMa-004Uq2-MC
 for samba-technical@lists.samba.org; Sat, 04 Apr 2020 15:05:36 +0000
MIME-Version: 1.0
Subject: Re: [PR PATCH] [Closed]: samba-tool - uncaught exception bad call
 flags
To: samba-technical@lists.samba.org
In-Reply-To: <gh-mailinglist-notifications-7cbc67a5-3baa-45ba-be96-ccfa955fbabf-samba-217@samba.org>
References: <gh-mailinglist-notifications-7cbc67a5-3baa-45ba-be96-ccfa955fbabf-samba-217@samba.org>
Date: Sat, 04 Apr 2020 15:05:36 +0000
Message-Id: <E1jKkMa-004Uq2-MC@hr3.samba.org>
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

VGhlcmUncyBhIGNsb3NlZCBwdWxsIHJlcXVlc3Qgb24gdGhlIFNhbWJhIFNhbWJhIEdpdGh1YiBy
ZXBvc2l0b3J5CgpzYW1iYS10b29sIC0gdW5jYXVnaHQgZXhjZXB0aW9uIGJhZCBjYWxsIGZsYWdz
Cmh0dHBzOi8vZ2l0aHViLmNvbS9zYW1iYS10ZWFtL3NhbWJhL3B1bGwvMjE3CkRlc2NyaXB0aW9u
OiBIaSwNCg0KcGxlYXNlIGhvdyBjYW4gSSBmaXggaXQ/DQoNCnNhYm1hOiA0LjExLjUrZGZzZy0x
K2IxDQpweXRob246IDMuOC4yLTINCjUuNC4wLTQtYW1kNjQgU01QIERlYmlhbiA1LjQuMTktMSAo
MjAyMC0wMi0xMykgeDg2XzY0IEdOVS9MaW51eA0KDQojKipzYW1iYS10b29sIC1oKioNCmBFUlJP
Uig8Y2xhc3MgJ1N5c3RlbUVycm9yJz4pOiB1bmNhdWdodCBleGNlcHRpb24gLSBiYWQgY2FsbCBm
bGFncw0KICBGaWxlICIvdXNyL2Jpbi9zYW1iYS10b29sIiwgbGluZSA0NCwgaW4gPG1vZHVsZT4N
CiAgICByZXR2YWwgPSBjbWQuX3J1bigic2FtYmEtdG9vbCIsIHN1YmNvbW1hbmQsICphcmdzKQ0K
ICBGaWxlICIvdXNyL2xpYi9weXRob24zL2Rpc3QtcGFja2FnZXMvc2FtYmEvbmV0Y21kL19faW5p
dF9fLnB5IiwgbGluZSAyNTYsIGluIF9ydW4NCiAgICBjbWQgPSBzZWxmLnN1YmNvbW1hbmRzW2Nt
ZF9uYW1lXQ0KICBGaWxlICIvdXNyL2xpYi9weXRob24zL2Rpc3QtcGFja2FnZXMvc2FtYmEvbmV0
Y21kL21haW4ucHkiLCBsaW5lIDM1LCBpbiBfX2dldGl0ZW1fXw0KICAgIHNlbGZbYXR0cl0gPSBn
ZXRhdHRyKF9faW1wb3J0X18oJ3NhbWJhLm5ldGNtZC4lcycgJSBwYWNrYWdlLA0KICBGaWxlICIv
dXNyL2xpYi9weXRob24zL2Rpc3QtcGFja2FnZXMvc2FtYmEvbmV0Y21kL2RvbWFpbi5weSIsIGxp
bmUgNDQsIGluIDxtb2R1bGU+DQogICAgZnJvbSBzYW1iYS5qb2luIGltcG9ydCBqb2luX1JPREMs
IGpvaW5fREMsIGpvaW5fc3ViZG9tYWluDQogIEZpbGUgIi91c3IvbGliL3B5dGhvbjMvZGlzdC1w
YWNrYWdlcy9zYW1iYS9qb2luLnB5IiwgbGluZSAyNCwgaW4gPG1vZHVsZT4NCiAgICBmcm9tIHNh
bWJhIGltcG9ydCBnZW5zZWMsIExkYiwgZHJzX3V0aWxzLCBhcmNmb3VyX2VuY3J5cHQsIHN0cmlu
Z190b19ieXRlX2FycmF5YA0KDQpNYW55IHRoYW5rcw0KDQp2ZWNpbm9oawo=
