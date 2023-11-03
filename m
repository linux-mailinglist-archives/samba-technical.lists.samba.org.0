Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id E16D47E0710
	for <lists+samba-technical@lfdr.de>; Fri,  3 Nov 2023 17:54:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=M3YFd4rhDnEVBUcRfsLKm8J6yBC2JBh8uFkcA4kWRaM=; b=0lw1Lxtd2zMhtT/dj4NuvGmgsl
	+ly6LDCLwML6U4XbjHrWMXIiNwYQfkVbFTEkVNFAiesuTlIbntbpplbVU6IRkH92DeETUDbXO/0la
	1FahhJTUlI3DOcuCVRKaTP7yJo9SHubC0cHiboLlk7y52RxzowAnVow0/M8mGwHknPoul3oLhCgnZ
	b+5MGLcr6X/8Z3X2HDrRRNHZiBabvwJYhcXo3AdHRNuKEGS+9de91Ut/nP5+467kXHMtEWEkgb1sT
	lJ41l87ib5D9m1c5JAKzBHCKx5llRM+LXqwL5b5Pq1v2lzD0K1r5a8ovg+03dcdPlrc21OWMhjDcQ
	Ity/OSXw==;
Received: from ip6-localhost ([::1]:31390 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1qyxQn-006H88-CO; Fri, 03 Nov 2023 16:54:01 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:54194) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1qyxQg-006H7y-Cn
 for samba-technical@lists.samba.org; Fri, 03 Nov 2023 16:53:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:To:From:CC;
 bh=M3YFd4rhDnEVBUcRfsLKm8J6yBC2JBh8uFkcA4kWRaM=; b=NJPdhFU8spyQo1/UQptBa9rbLk
 vSQ0erUaEwYOb+RLuqqGzxvoeU8cbUCuXhnNFdexRCumJ2GMeREWuinEGqJ2W9F+vedfx2ascPpdj
 YaiZxWDpO7C0kpiabEqInDruPRN4CSdCJphnW7UJA0s7ZXQDM/NqiATNE9xi1uJO+yUSA1yP+WxRY
 PlL43hGzbkh79x8ns6aHDJgudb4hsp1PrD7exS9PLAae4f+wO24xVNEKBaLIaX0fiql7vfqnVQH6o
 sXGCGk7xhHzgviT3z6onvTwn1pkkt4Fs62jFWcgbNNQ/yp9GQsPdpmttEpNzp6BrA2TmEezBM6Sjx
 e46LIDVFaNXODa7Z0nuxVp7FCDUyFZg0WkusM7kifjNXXHwBbktFNHki3/3SDp23JPvQuAo1mx4vB
 lFQyx9uSR6no/E/P1W40TfN03s0kRZwDzf1r1qmDom3L1oP3IFrI531H/Ev+GWS5srHWLu+ldvyiC
 EWk91m7j91RNmaB4t33Lv9iN;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1qyxQf-004CtL-1V for samba-technical@lists.samba.org;
 Fri, 03 Nov 2023 16:53:53 +0000
To: samba-technical@lists.samba.org
Subject: Lightning Stream syncs LMDB databases through S3 buckets between
 multiple servers
Date: Fri, 03 Nov 2023 17:53:51 +0100
Message-ID: <6695367.31r3eYUQgx@krikkit>
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

Hi,

a friend of mine pointed me to lightningstream [1]. This is interesing as it 
syncs LMDB databases through S3 buckets. S3 buckets can be also self hosted 
with minio [2].

As we started to use lmdb, this is an interesting way for a central database 
approach.

Maybe an idea for a ctdb for the future?


Best regards


	Andreas

[1] https://github.com/PowerDNS/lightningstream
[2] https://github.com/minio/minio



