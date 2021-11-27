Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 87F0646013F
	for <lists+samba-technical@lfdr.de>; Sat, 27 Nov 2021 20:46:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=n/vpJ4uYs3FbtlFDc2fDvQd3F20YtZOAFpAagkWfDxw=; b=O7spIzu6tnkZE+Og1zrJAnS6IS
	6lNz7+R7xDshnKB7KMQ8RJ6xYBgWcQ6nqHVnpNDdrwCN3fytIPVwut5xqI1dafGk5CG6T3duEhcfA
	e91LNFjzRoQcfvzbgBq9wxybtSPzbVMh7uOjnISlR7iWvKkR4qWmDm7fm2ZhYk+Wsg8xDRA3CI2Cc
	h33YYpL5GNaR53LdhUh+XbIP4JjPqGbGlPD8RK0JHqYOuGibfUbw8kitKtBoeXTdzUrH0Nf1gK7PE
	XjFsh0sKnyYAkIYj7xxgqEA36L9Ktgc8dGBuTxMc9KGckl2Kr1LSmuZZwhDRBZtTD4iWTaIj8Tw0G
	STEAsK0A==;
Received: from ip6-localhost ([::1]:51284 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1mr3dV-0003zY-Bf; Sat, 27 Nov 2021 19:45:25 +0000
Received: from mail-qv1-xf31.google.com ([2607:f8b0:4864:20::f31]:45904) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1mr3dL-0003zP-6I
 for samba-technical@lists.samba.org; Sat, 27 Nov 2021 19:45:22 +0000
Received: by mail-qv1-xf31.google.com with SMTP id s9so10228280qvk.12
 for <samba-technical@lists.samba.org>; Sat, 27 Nov 2021 11:45:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mattgrant-net-nz.20210112.gappssmtp.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=kxbxnkZx7iziGAPlovzHsGsbSHSMGWARGH9obU/64i4=;
 b=gCELdyp5wRVtI/LZ5N/k8bOBnFLlgVPCUHtJRMEpWhRGBHYmtK+wE2WxK+I01cC05O
 E2Lu7iOV3ffjt+QPG+TmzqWDcPPQWGCPenAWSxYNA4gniWVpkcOb++Pt8FTY3rhO+zlK
 Vva0SnatdMHyigASsxF2ARYnBgJSjvusj2998XjMhMXBR2hobLvK35Otl/jdJoKbsQKy
 Ea5uZARgXoan6WK4qSlClEfFjYegEXsLSe4fhqTo10KVIi5GdsIDsXjfUmSFn+NEjcOI
 tafyZ3fU5au+F5xEt31janmdNcc6ptNIE6pu7rM9JiEx6ahloSE6p3NqKwm7S26ojsN3
 UjQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=kxbxnkZx7iziGAPlovzHsGsbSHSMGWARGH9obU/64i4=;
 b=GRdBzmHRp+Rg6gxoYvZBKk0LwtSLRhdPNTkhrb9sp5lWqx2LiHVHFf6ZcFuNuDItM2
 RT1bHzftSQEbHx8ivWTU4n53hYnfi5OkexUwkWgZZ0KdY7SUg+iXQryu+tW25UYlOVK5
 G2ylJQLUh5Aw9GcTa03ME06neVls5xRBXgxK+Rvq4nDpq8A6aSBNDI2YX7YAYim2Lx5q
 roJboggfCVXvx+66PFueL0fPAVqElVBAMjZ5f24qVdECmsnZcoB57pJQQ0CTrx17RRiq
 iFVCRT9tKfuDtBptiQi6L60zeXZyZmwjV5v8d//nePh/5wMFL7wpVn2dzpDWFF8UOs/s
 eBBw==
X-Gm-Message-State: AOAM531XzxXHh8ex+38F/Uo3uOd4Coy1cn6jyh5A0K1y+qLwyqpEJJSd
 8qd+gGuc/A4otKDc10m9JABi4BECykRhhyxbw8CQtplBZSpFiA==
X-Google-Smtp-Source: ABdhPJyYjWdSjVkhS1cQyFRedPHDBpar/Wn9G7lTZlTAfoCebuVw55sR+sUUHGbE/bidr59WrlO7rwP9f1EiMUMjTRg=
X-Received: by 2002:a05:6214:19e3:: with SMTP id
 q3mr33752070qvc.35.1638042312816; 
 Sat, 27 Nov 2021 11:45:12 -0800 (PST)
MIME-Version: 1.0
Date: Sun, 28 Nov 2021 08:45:05 +1300
Message-ID: <CAHA-KoMMWdtT3Mt5=2d8Ndo4-iytM+e_u8w_hy5-X1aHPivZFw@mail.gmail.com>
Subject: RFC Merge request !2271 - DNS updates allow/deny for SAMBA_INTERAL
 dns server.
To: samba-technical <samba-technical@lists.samba.org>
Content-Type: text/plain; charset="UTF-8"
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
From: Matt Grant via samba-technical <samba-technical@lists.samba.org>
Reply-To: Matt Grant <matt@mattgrant.net.nz>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi!

Could some of the Samba Team please have a look at the following:

https://gitlab.com/samba-team/samba/-/merge_requests/2271

Could I please have your thoughts on the code changes, and a bullet list of
the tests that you believe are required for the Samba test suite.

Here is a summary of what this patch does:

Mechanism for DNS update host/rrnet allow/deny lists. Three functions
dns_update_check_access(), dns_update_get_caddr() (gets subject address for
check from A, AAAA, and PTR records), and dns_update_ipaddr_check_access()
are backended by allow_access_flag_lo() from lib/util/access.c using the
already existing host allow/deny access mechanism.

Thank you so very much!

Best Regards,

Matt Grant
<#checklist>
