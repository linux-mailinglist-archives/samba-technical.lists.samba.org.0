Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id BAA42A76942
	for <lists+samba-technical@lfdr.de>; Mon, 31 Mar 2025 17:06:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=kf39RGJZPGbvEIW9xnBAVFinc4tThnLv5uAdN85ppsc=; b=xdkaAY+JaiU7Jl7/NZ/CZy0Qkn
	wbSi9LO9YZ7nJXNx3114/LlBLfSHvGq9N7+aFi52Cu3csM7puIrvN011TEjGkQXY3VLP7ckwfNP4L
	ZEY3Ucwl2oeHg3Bjf4SSGL/jT65+uj49EVbV6VI6ah8xyZ5z5rLW/b7XmExBBvLB7HegiRrs+GKTv
	DQb4MHH++2A3bnJ//05gFqX05VF8+s5GjlKHa+tYlt0WL4+ZetO+KG5XPGL/wRfZVjIN5LhnQp7bb
	h1/x7uETwWX2K0uVh4mVtiVpMWCI+wUTZp10fxSEoShksAx9pHLYGqaGg3m2oKwXwzhwZAK1vT7oU
	Lyq7PIvA==;
Received: from ip6-localhost ([::1]:18974 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1tzGie-00HDDQ-6z; Mon, 31 Mar 2025 15:06:32 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:52164) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1tzGiS-00HDAR-Vt
 for samba-technical@lists.samba.org; Mon, 31 Mar 2025 15:06:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=kf39RGJZPGbvEIW9xnBAVFinc4tThnLv5uAdN85ppsc=; b=aRq3Q19XhGyI3v4fK6LCyoozor
 YMijUArCDpDETE6GL8zx+3iXmJ/pxPM8WGQPxyQVThJzJV8GmghktaMRcwr/ceWppRxfDolEOtdVY
 0yqyk/w3gWDVLDu0Suj9hfnpSxRYtTEF4OvjwXbpfVn9fRb/oEC4pPCHdpSV+yCaZp2bSM+ykxK1c
 OmHaD770oz9y6GRc14hki3fCHbQ+G8pl2a7uf+TaGp3RIHqpvHjUvMyfheStYoglcte4gMWEJFDJM
 UrdRbYD2C+ys40aifE5ytepqXmK6t3E5llEeGP2VugFHrEUzSLQ4YEg8lWHaK5256J23TDUuesIii
 lVqCpw6hKX74iU6vtyFg4El1Y3aCLhmX7XSYr2a5W6Q/AnNdESDtEUlttU23Cw5FRgWTnqMQqMEjc
 i1zoWBkYz+YikAERnzFnhh2GwY35J78t1FCWOxX1ZLoXMHUFvkgXzjKxFtcnZ2hyAcG5a/cEPfyO4
 fd8SYm4EDMsFSn6bva0Jxo5k;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1tzGiG-007W5b-1V for samba-technical@lists.samba.org;
 Mon, 31 Mar 2025 15:06:08 +0000
Message-ID: <088da2bb-ea3d-4788-8c53-86b334c16c48@samba.org>
Date: Mon, 31 Mar 2025 17:06:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: de-DE
To: samba-technical@lists.samba.org
Subject: [Release Planning 4.21] Samba 4.21.6
Content-Type: text/plain; charset=UTF-8; format=flowed
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
From: Jule Anger via samba-technical <samba-technical@lists.samba.org>
Reply-To: Jule Anger <janger@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi,

Samba 4.21.6 is scheduled for Monday, June 2 2025.

https://wiki.samba.org/index.php/Release_Planning_for_Samba_4.21
has been updated accordingly.


Jule

-- 
Jule Anger
Release Manager Samba Team  samba.org
SerNet Samba Team           sernet.de


