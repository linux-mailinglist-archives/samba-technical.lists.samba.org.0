Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 40DBD2569ED
	for <lists+samba-technical@lfdr.de>; Sat, 29 Aug 2020 21:54:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=vvhYdUPSK8VmXbcF4B0vLYOe4l9wdvPNvcivcmaSL4M=; b=zQZ7CbgjkV7Ect4sqb48nxmbQc
	+AfmZR/rryFpcJ5bsHSNmhH8Fw/UJaclvqqJmVXPC2IYhtIR0aILcVNbqBI+tMMz/vzmGDexjG0LD
	of9JtiQ2kbYjkaJw2FQ4sAAuax0IcC4L4znXacfOlGDedqfqvDsc52gQjMLtey3Vm04RL0uhP0o+h
	qQvR13Tc1ypkA5DWS1iso6tJMHZqoaS2aRRQxGNs0uxli9YvTIgviDn3vcrxLUdeEc+tRfxAz2KL5
	x9dG/PQYtpuHS/WGx2a/k+NCEvpRHM245E6S1lLQ2KUzP5ADgAVm9lruZmqsmqDkkp0jETi+2FHn7
	DuCfgIDg==;
Received: from localhost ([::1]:41064 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kC6uW-001Eqn-Of; Sat, 29 Aug 2020 19:53:12 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:14214) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kC6uR-001Eqg-Kj
 for samba-technical@lists.samba.org; Sat, 29 Aug 2020 19:53:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-Id:Date:From:To:CC;
 bh=Zj3quZn0X+UutJQb6b7V5CLkBk3OJobjN1RqJ2v7CU0=; b=H5QaLhk9FHqOCL7WBm5p+tGsmR
 4q0DNaVBx4FnS11jILRQ1C8M4ZqKaVSP8Cqsha5tDvGvvBKgRjC6RrQqfkgJeZQs6jBPPJGTFwG3Q
 YQ1XDWPncF0XsIujn4Vgosk6VOm3q8BUTDBnJjw7xZbOeZ1BGGy8HWqWBfpb6stcUAIJfbHGEb3M/
 TENb9+SxJia4gVPWQ1+l2LhBKuuGuOeJxnr2w6PzmusDS8gtmivGJQLzgZKmR3LfnAQOA+hYAsy1i
 u342G2GlRbqPPLtf1QASLolqNREU2WxUfPliYxgedn7RD2/1v79R47OXMYPHnh79Rw0Qwqf6bZCcr
 FRem86Dyix5jV0x6iJGYZnnbceiJgWukji7AT0otUsMUGmfE9RoIU+ZVxZMv2MEowUmrh7bUku0jF
 tcBjqox+TxxoZSxgGKwP6vCLggAUaH6hp5AzZAwVuVq0PEC+1UbZqZ7VOqr2KSLO8u0s9fq4GGipw
 FqxdEgCI33v8i24xh5USbLZ9;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kC6uO-0000nK-Ex
 for samba-technical@lists.samba.org; Sat, 29 Aug 2020 19:53:04 +0000
Received: from localhost ([::1] helo=hr3.samba.org)
 by hr3.samba.org with esmtp (Exim 4.92)
 (envelope-from <github@samba.org>) id 1kC6uO-009Cr9-Bh
 for samba-technical@lists.samba.org; Sat, 29 Aug 2020 19:53:04 +0000
MIME-Version: 1.0
Subject: Re: [PR PATCH] [Closed]: Add a lttng VFS module for samba.
To: samba-technical@lists.samba.org
In-Reply-To: <gh-mailinglist-notifications-7cbc67a5-3baa-45ba-be96-ccfa955fbabf-samba-205@samba.org>
References: <gh-mailinglist-notifications-7cbc67a5-3baa-45ba-be96-ccfa955fbabf-samba-205@samba.org>
Date: Sat, 29 Aug 2020 19:53:04 +0000
Message-Id: <E1kC6uO-009Cr9-Bh@hr3.samba.org>
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
ZXBvc2l0b3J5CgpBZGQgYSBsdHRuZyBWRlMgbW9kdWxlIGZvciBzYW1iYS4KaHR0cHM6Ly9naXRo
dWIuY29tL3NhbWJhLXRlYW0vc2FtYmEvcHVsbC8yMDUKRGVzY3JpcHRpb246IFRyYWNpbmcgVkZT
IGZ1bmN0aW9ucyB1c2luZyBsdHRuZyBpcyBub3cgcG9zc2libGUNCg0KaHR0cHM6Ly9sdHRuZy5v
cmcvDQoNClNpZ25lZC1vZmYtYnk6IERvbmdtYW8gWmhhbmcgPGRlYW5yYWNjb29uQGdtYWlsLmNv
bT4K
