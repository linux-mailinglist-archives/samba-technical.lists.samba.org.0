Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 46ECF50409
	for <lists+samba-technical@lfdr.de>; Mon, 24 Jun 2019 09:58:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=udaYCsUV5k/QxyDJG0Cdv+5AxoVH8FAsThKRQoMxLsQ=; b=TR87EIwzjgqOL4WKd9+axvm4WQ
	QRWQ7L+2c8xS5TQqLQZWlwnBc21yaO+5LzKtxyuiyXpxEgu2Rb3hVVq6eUpM3egdpXH6SfHsLuieN
	IfxDpTEXrnt/7eet/x6WAs6EMHhrYxikys548Ljy7eAZLHDiWg5VmXeq8/ZREfE0hn9JxHW6zm2jp
	ckSNMS5eV8ZpieIUgIgMoR+mbBqsWuq/LrnmAwS7MFxyZFg8vTEjy8WbwMESyR22Ymp0IIjbjp02O
	daRRI9WajJPGids7J5VkF3dIfklYQ/fpJXI87/GhRcyz32hHfrY1canAOq1IrjWQ9zcCD7Z9DW4AC
	yU3sSKCg==;
Received: from localhost ([::1]:33580 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hfJrz-001Omu-5x; Mon, 24 Jun 2019 07:58:31 +0000
Received: from mail-pg1-f182.google.com ([209.85.215.182]:36576) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hfJrv-001Omn-0e
 for samba-technical@lists.samba.org; Mon, 24 Jun 2019 07:58:29 +0000
Received: by mail-pg1-f182.google.com with SMTP id f21so6682851pgi.3
 for <samba-technical@lists.samba.org>; Mon, 24 Jun 2019 00:58:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:from:subject:message-id:date:user-agent
 :mime-version:content-transfer-encoding:content-language;
 bh=udaYCsUV5k/QxyDJG0Cdv+5AxoVH8FAsThKRQoMxLsQ=;
 b=Hy4jN3UJyHSWDV69snucJl+EiydG/JTWEcvx/p6hL+mE3XZISbzmxrn9scqxrMrjlZ
 QMowMLAQjWvFTy4czBi6ErB/64Q2Dl95WpPvfYLOW/9Dx2HpUle/cLhqVrL2kTE4WXQ+
 ztTcS2QfU04x9rSQqPFStboOE982AuAQthG9gH0x+0U6p/smCe0ivubUUp8L1ONCqUjp
 Omx5Uxjvkj7dRynv0pGWBdBZJRPEUkXYzIKmyvmFhSU8GCRG6bi8hBPgY0lQR4+Kk+/3
 hkE8jYvrAJ51sgIocq9BCqVuuMBPUH4iNL+eVG8YJp2Zd2DZwo7U1hIPImVvXAIMBp9S
 lZfw==
X-Gm-Message-State: APjAAAURJPt56UZlmLMyNUA4OTJhJEhz3QftIk1DHWXQquSbxEx4tOL1
 VsFjT9aw5ouALmUgjbbYArRqMp2jj+c=
X-Google-Smtp-Source: APXvYqw8M4SkR0T7kSlLOjqWg31vJdkP8/vIi1PpxXqfSgigjly2wJDRrlQRzQt5TpgaS3tHAGqRfg==
X-Received: by 2002:a63:570c:: with SMTP id l12mr4324156pgb.25.1561363104332; 
 Mon, 24 Jun 2019 00:58:24 -0700 (PDT)
Received: from amitkuma.pnq.csb ([125.16.200.50])
 by smtp.gmail.com with ESMTPSA id u134sm1919243pfc.19.2019.06.24.00.58.22
 for <samba-technical@lists.samba.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 24 Jun 2019 00:58:23 -0700 (PDT)
To: samba-technical@lists.samba.org
Subject: Can we RESOLVED/FIXED
 https://bugzilla.samba.org/show_bug.cgi?id=11777?
Message-ID: <121489a2-9794-9084-e0a6-cc23bce7f0c7@redhat.com>
Date: Mon, 24 Jun 2019 13:28:21 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
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
From: Amit Kumar via samba-technical <samba-technical@lists.samba.org>
Reply-To: Amit Kumar <amitkuma@redhat.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hey,

Sorry to bother all, But I was just looking for 'net command' issues and
found some have already merged patches.

Thanks
Amit


