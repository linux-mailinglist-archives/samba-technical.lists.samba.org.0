Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E95636EB60
	for <lists+samba-technical@lfdr.de>; Thu, 29 Apr 2021 15:31:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=UEdSIJSfRLTZ1hgsl9O4s6YRrAi+HxnMT37XYk7Vqd8=; b=i2hZ6rAEgK9VaSkEhMZoO1XeF+
	YBOdAiWPpJ5KY5fmODekRa3bZ0jbI10MFnNjIu2dvEbJsEJeRu1QKdMDQPV77HCjULxbPHn/P209M
	3o96znhLEQU57RghNDCtVj5mQ3Qy5sk69qC+kZuePiBFW3A1LpKO83K1mi7/MOnqvBDP8hZvbmjtQ
	+drEfwkjSRVS0lVmQf+7mnrKDvhUDPe8gAtIOCnNs15rBTfEN1l6J1NhIgwpRG4VoHRIEQfwvnfNd
	OqP/L2KW7N23/YZNmgjJMkoBLZqbHmDfEP68Fm8zjnFqUqtJbosVnD+uvImAr3MssC8va/HNrFy0b
	mhRVE8Zw==;
Received: from ip6-localhost ([::1]:43556 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lc6l1-00DA4R-Eo; Thu, 29 Apr 2021 13:31:07 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:20562) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lc6kv-00DA3m-VZ
 for samba-technical@lists.samba.org; Thu, 29 Apr 2021 13:31:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:To:From:CC;
 bh=UEdSIJSfRLTZ1hgsl9O4s6YRrAi+HxnMT37XYk7Vqd8=; b=tVknqgqoGuAFPHoxdwzPKXLwjs
 s2Eq7oVJVuAM87R0P2pfQQEygATkXHyH3wxObAUuDb7ORCI7aDfGTv9HHdVxD+YxgTC8EjLWkX6aN
 uo8zIvMXteSXgERmDFWB4z5PHlP08twmYVr3Uy3cHpd37MgV9m8V5HxRFXm2Qe30NqWkaFOwc+lIH
 IBEGqU765keoZ+sd08Yg9mxbpHw6QuoHOhlO5SH48KYXk5ZCLIEqcMPnGq+Y5644KB0MSdjrtRc83
 0277NJgHH1o29BQ2GwNO1dqpsDOHyF2aIFuhrLJH+Bc97tDTzors8IeGVJCDMPYxSVRsENbPowSCR
 UHsZ29iN6/gIfeSDPWI6/rN+MWR3mz42XTrxjna4rrZhrNuoKwS9/If5A5RI5WFQR9E6buGWkLF4w
 8KJR1nsXJQAMTuXwRl7tNwpWn0pow2u1GqLbhfqcTvrnoMKCd6tKx1f9Z9VtO7zr2XVRPwLV2nBf0
 9AkAgzKwuaZ4kUTs6subv8vQ;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lc6kv-00055T-GJ
 for samba-technical@lists.samba.org; Thu, 29 Apr 2021 13:31:01 +0000
To: samba-technical@lists.samba.org
Subject: AF_ALG (Kernel crypto API) support in GnuTLS
Date: Thu, 29 Apr 2021 15:31:01 +0200
Message-ID: <2460211.fo9arXfyE7@magrathea>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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
From: Andreas Schneider via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andreas Schneider <asn@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

More details at:

https://blogs.gnome.org/dueno/af_alg-support-in-gnutls/



-- 
Andreas Schneider                      asn@samba.org
Samba Team                             www.samba.org
GPG-ID:     8DFF53E18F2ABC8D8F3C92237EE0FC4DCC014E3D



