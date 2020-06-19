Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id C392D2019AD
	for <lists+samba-technical@lfdr.de>; Fri, 19 Jun 2020 19:46:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=4zchYO7toLml5/b0xvh1HtIrUPHyuP7pHMMHTe+5Lq0=; b=BrOQaEjxzoECwkHAGoJTjJGpPC
	8Pv5wTeQnNs5ZGRwaefRdhvp46dCBTTMlA27Madh2eyG8VIFSzXQiOruiMTLSivMsNSU8sFh6rV/h
	x+IPTu41TmkvZdyJ3dcw3oD6OpeGEGIqA5c8M703wVfeYH6bxAES3jXz/IhX6epEbxA10ilimgnMA
	S4Vw/UcblYSbhny0PzGQHh7kJgcMCtfAp1fp4HscW8xhNTbjs1k3E/F+ILZU5iSdclo9wU9grUf9r
	YurpuTVgj9Vua0WpIhgk6IavZKtH44Bg7Buz/8kujzBhxBU8JT6IlOm47xIPl2PGGNrRA1pUhMcDM
	0htaCrqg==;
Received: from localhost ([::1]:34752 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jmL5H-001Rty-Sa; Fri, 19 Jun 2020 17:45:47 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134]:38651) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jmL5B-001Rtr-U4
 for samba-technical@lists.samba.org; Fri, 19 Jun 2020 17:45:44 +0000
Received: by mail-lf1-x134.google.com with SMTP id d27so6034773lfq.5
 for <samba-technical@lists.samba.org>; Fri, 19 Jun 2020 10:45:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=4zchYO7toLml5/b0xvh1HtIrUPHyuP7pHMMHTe+5Lq0=;
 b=eZEXfUGq5IVdITncqNuplX8zPS9YcWPYqhIekIcCKzrlweOGs7yZC6UExyELZ4DSBG
 zV0TgnZlkKEqK5FV8H2R2oO2FdRUBxTMty3sUKOofFAQrqOVajSYgDLBkSb0VCzVhwTl
 XwKd9MEyFArjrYrcHtg3o9jUKq+zcpylTME6VaYpaPrca3FNbgpBmAuWooJW325ZvvMG
 BKebowwqnlHV5DFQYdujdqTZAGmIWf8otwEbLvHufI3ZB5WW2Py2fi+tTieBrWlPmgPg
 33Gp5DnHuuZtnWCLOq4rO6/3NfbOoZ+6mjJ1sLC3MlBl45TfLV6XxuNiOykVTnz6mrjN
 O1aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=4zchYO7toLml5/b0xvh1HtIrUPHyuP7pHMMHTe+5Lq0=;
 b=lYiMwCWbWj+ELMp+3q2ttAouHHwa/99AUchP4cINAX6vaR1yudD84QnJgOYSMBxBa+
 1nZm/hNG5kDadhZkKzoE4USa01SG3jWBC7MqgxlTwV6XpljGzuJjhYsV+UL4E6Q2T3Hq
 kQDJApDdQVWxz5ha4oTjT1YvU49R9vK8+K9WVP98QWbWzNfUnkF2w4gGZUKlR2qMC8L1
 bsnuGbe7j6Y3pgQHN/36s8ZeqivZu/CvA/2gY4CJaF+QG4KMzJqVH/Fj0iEbvq8nhqBp
 hrvbovtHeOGoT7p+hzfXM6W4jKTys3PC+GFnbpHJPY9SmfTEf+C98mO0B+U2iY7MfJj6
 WRaw==
X-Gm-Message-State: AOAM533OQ8wPOuz8QwY8I85X6VpOmHe6mu1sHTVthLcrG8dRzBrREH4+
 12qUlyjfevz2hy7aKeInZrFIZ71tgs+HTFXFdvjKMv2F
X-Google-Smtp-Source: ABdhPJxc73EP7a+yFw8+1Bsn7wG5dGbAJqmXHSnBGm8H4VWKW9292wauzny93uM3GRsl3Y6lPvJ/l54u1s04zl6Bn3Y=
X-Received: by 2002:ac2:5a5e:: with SMTP id r30mr2589510lfn.30.1592588738940; 
 Fri, 19 Jun 2020 10:45:38 -0700 (PDT)
MIME-Version: 1.0
Date: Fri, 19 Jun 2020 19:45:28 +0200
Message-ID: <CAC-fF8TH5sf6ekjfG5QqnEwG41fopV1bWOMxBH_UnodfjDo_qA@mail.gmail.com>
Subject: gitlab: testing of ldap-ssl-ads option
To: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
Content-Type: text/plain; charset="UTF-8"
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
From: Isaac Boukris via samba-technical <samba-technical@lists.samba.org>
Reply-To: Isaac Boukris <iboukris@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi,

I'm trying to add some tests for the ldap-ssl-ads option in
ad_dc_ntvfs and fl2008r2dc environments (as ad_dc doesn't allow SASL
over TLS):
https://gitlab.com/samba-team/samba/-/merge_requests/1402

The tests work locally but in gitlab I get this error:

 UNEXPECTED(failure): samba4.blackbox.net_ads_tls.join(ad_dc_ntvfs:client)
7111 REASON: Exception: Exception: Failed to issue the StartTLS
instruction: Connect error
7112 Failed to join domain: failed to connect to AD: Connect error
...
 TLS ../../source4/lib/tls/tls_tstream.c:554 - An unexpected TLS
packet was received.

Does anyone have any idea on this error and why I only get it on gitlab?

Thanks!

