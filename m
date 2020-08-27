Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FA3A25508F
	for <lists+samba-technical@lfdr.de>; Thu, 27 Aug 2020 23:28:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=aLfRMDYaA06S85zYS8j9X7ZqbZR9lsSLJD7qSl7byhQ=; b=QSSAaSgVq8mMFnK6KmPT5d2FvA
	ehLqjgOYUHpKuxCDmEavTu/ylkW3wYP/LMQ58Is4LOHLf5pwLU4hVyPIZUpZoyC0haFZNGX7M+hYd
	B43/SRNb4m0KL+oygv7FNB69K42RgwXK4S8hnb/blB9mv2BNZGb/e2xMmEWCTa3BUi7QyETjVh+xm
	/HWwrct+DJeWTSVD4+2kTMzI1kX24n17TFr4w4zNj+DEobqD+achx2+Bqq5xJvfBpHAbHHruVxNi1
	9+xVe8/hnC4seQYkFw1qfiRWUHK3ifQ0Oclg3O72SrG+jEwbD36hKXc9rqBu43DUKXIpwVTpSRPoV
	4J9ClgQg==;
Received: from localhost ([::1]:64032 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kBPRk-0010r8-US; Thu, 27 Aug 2020 21:28:36 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:34686) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kBPRg-0010qz-0J
 for samba-technical@lists.samba.org; Thu, 27 Aug 2020 21:28:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-Id:Date:From:To:CC;
 bh=RbLq9GD4VsKm4nNnPbg1MjybxC9Em2SoKk8fi4V/R9s=; b=3fo4L7PAJEHXM+iYbbk7NxHhm0
 H/4UPam2k+If6+RexhY/jeFo+CqDorqXDqRE/7H0IZ2luZb5EB/vfu1btPuAWXABimGGPNwNu7MJJ
 OeALf1ykMPCuIfZAj5q6wqhX354lmw9gkgrpD85QIytnkyvspERRZAG9t2sticnQll6rm3kKxgFYw
 RETQXOXybzkWSUa4cagIZBoBuqNS3KoTPoZklbT+ZypXXZGY8ZYq4mtxkY4Zp8EaH5A/y4voUj6hn
 ozIJDtbSR8+sxBC6HalFdY69/zeUWYcbUibW3+PwWuT+JbmkZBsanHDyFlI6sFi2LtTeWxYO03wr2
 fWC3P3QFXkQqY6mTDxXRGLIO0u2oOeKnK4I2TnKYNVJxSb+moHole0Dhdzszs3mW0bKKouq6CwqgV
 RibrCx3uwHEYvDF0KzVH4A+GhG8lWnG5+2iY9EnY3/HQJVIGI1kX7obc7qYHw+KjpdKDrZmanx7Fl
 qXvoI6wVcirixzgaM3I+ikw/;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kBPRf-0004QW-PC
 for samba-technical@lists.samba.org; Thu, 27 Aug 2020 21:28:31 +0000
Received: from localhost ([::1] helo=hr3.samba.org)
 by hr3.samba.org with esmtp (Exim 4.92)
 (envelope-from <github@samba.org>) id 1kBPRf-006isB-Kr
 for samba-technical@lists.samba.org; Thu, 27 Aug 2020 21:28:31 +0000
MIME-Version: 1.0
Subject: Re: [RFE] smbstatus -L does not resolve UIDs to names
To: samba-technical@lists.samba.org
In-Reply-To: <gh-mailinglist-notifications-7cbc67a5-3baa-45ba-be96-ccfa955fbabf-samba-202@samba.org>
References: <gh-mailinglist-notifications-7cbc67a5-3baa-45ba-be96-ccfa955fbabf-samba-202@samba.org>
Date: Thu, 27 Aug 2020 21:28:31 +0000
Message-Id: <E1kBPRf-006isB-Kr@hr3.samba.org>
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
Cmh0dHBzOi8vZ2l0aHViLmNvbS9zYW1iYS10ZWFtL3NhbWJhL3B1bGwvMjAyI2lzc3VlY29tbWVu
dC02ODIyMDA0MDIKQ29tbWVudDoKQGFtaXRrdW1hcjUwLCBmb3IgdGhpcyBQUiB0byBnbyBhbnl3
aGVyZSwgeW91IHdpbGwgbmVlZCB0byB0aGUgYC0tcmVzb2x2ZXVpZHNgIG9wdGlvbiBtZW50aW9u
ZWQgYnkgQGNyeXB0b21pbGssIGFuZCBzdWJtaXQgaXQgdG8gaHR0cHM6Ly9naXRsYWIuY29tL3Nh
bWJhLXRlYW0vc2FtYmEuIFdlIGRvIG5vdCB1c2UgZ2l0aHViLg0KCg==
