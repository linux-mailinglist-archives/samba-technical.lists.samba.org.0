Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 032BD43140F
	for <lists+samba-technical@lfdr.de>; Mon, 18 Oct 2021 12:04:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=/dOzoaFtEsDy8Pgxwl3D55uDEIqOY7bjBQwbBfBsggQ=; b=p+Qne0FFQ+oRlCM4cmCXiKpAGj
	oS3HE1IOw905ChRE4StcaZblVFb5fY6AOPLWMbggBAtog/WKNrdfyVv4H4KV5rMDJzsyqlYzTHRJB
	BAPr+VoEqaq4jMK8ticF6VVmiPRWmWIsvPMGcvTzQMqOfyCVTyZuD3KLUn3Absjp9M34YjUDHkwXg
	5+5KeJamFrNtkqj3L6TSL/yZ7qbQQgzJnmn2j8liDtRHKxo1DTL2HFuE/PQRlQqUHei6rwNML6cQ9
	hXtesDEOTmV5KqwThoT4rfZXh0m1SIYlHbs+TDkvs+3LX66QN2tGvbqZtnwqPIARu4ER5FtAM2w7O
	J+VQ/pCA==;
Received: from ip6-localhost ([::1]:48518 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1mcPUy-009tSz-VC; Mon, 18 Oct 2021 10:04:05 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:56480) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1mcPUt-009tSd-1S
 for samba-technical@lists.samba.org; Mon, 18 Oct 2021 10:04:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=/dOzoaFtEsDy8Pgxwl3D55uDEIqOY7bjBQwbBfBsggQ=; b=Gg3bDXKwRtSc3UOAZYYrggoFzP
 bga2wPwGD8VpTUBAKFmsBz6W1IHUOPHCfbfkajpUHjXIhLrczjlRM+CZHyK6jwN9S3JqTf6LOUdhv
 dvDtlnmfhpnqhFi+01q2xSH386WULWLTizsSVxz9TsYasM6HC7Jsk226db19X1n0guevNstxjip5u
 CUdchnQcJBrF//Ec0kDy0+JxLi5+sN7uUrx+MWzD+b7jneOMtvp+f9lhurbaYChKeRjAouaQjhCmi
 1YUx9UYgxXzEKNjcyItojWLpy8YedQ4+e5YCoqck6fZO+3u/6XE0gLKXM9fvp9NKU1/EskyiGSZ4G
 XiY45WlD0LmVWpAtNm4Udxdj3LnIgwdCxy4LUXBNWXnkXYD7Lm3uXG574y+Rku+vUd6Pk974vdp5c
 T6b1qZFmfIzEAFoJOQI0+d0Lx3xv507o3v64SEiTUeOmTdnAGtmTl6cHnJJDE4SKkDWGvYye65o9U
 V2XCZwrWY21/AT70Jek+0+Px;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1mcPUr-001y5s-9p; Mon, 18 Oct 2021 10:03:57 +0000
To: abartlet@samba.org, samba-technical@lists.samba.org
Subject: Re: [SCM] Samba Shared Repository - branch master updated
Date: Mon, 18 Oct 2021 12:03:56 +0200
Message-ID: <2303277.XuAQHBpyqA@magrathea>
In-Reply-To: <646fa34b-9a2a-84e2-b948-1c960049b4c7@samba.org>
References: <E1macwQ-003K2q-0I@hrx0.samba.org> <7009830.Vje2UjyrXt@magrathea>
 <646fa34b-9a2a-84e2-b948-1c960049b4c7@samba.org>
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

On Wednesday, October 13, 2021 6:25:58 PM CEST Ralph Boehme via samba-
technical wrote:
> Am 13.10.21 um 18:04 schrieb Andreas Schneider via samba-technical:
> 
> > On Wednesday, October 13, 2021 2:01:02 PM CEST Andrew Bartlett wrote:
> > 
> >> commit 7857e1249b72be8c8841b99cb0820c9c563178f9
> >> Author: Andrew Bartlett <abartlet@samba.org>
> >> Date:   Tue Oct 12 07:55:54 2021 +1300
> >>
> >>
> >>
> >>      .gitlab-ci.yml: Honour AUTOBUILD_SKIP_SAMBA_O3 in GitLab CI
> >>
> >>
> >>
> >>      GitLab CI resources are expensive and often rationed so
> >>      provide a way to test other things without testing an -O3
> >>      build also, as this will save 9 jobs.
> > 
> > 
> > Please documented it in bootstrap/README.md
> 
> 
> is that really the right place? I would think something like the wiki 
> where we already have a ton of related documentation would be a better 
> place.

This will work too :-)


	Andreas

-- 
Andreas Schneider                      asn@samba.org
Samba Team                             www.samba.org
GPG-ID:     8DFF53E18F2ABC8D8F3C92237EE0FC4DCC014E3D



