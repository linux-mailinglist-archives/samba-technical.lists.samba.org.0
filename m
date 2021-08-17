Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 533ED3EEA8A
	for <lists+samba-technical@lfdr.de>; Tue, 17 Aug 2021 12:06:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=2Cbt3J02G5bNukFchEMglwRe5OLuqbNArR3utjXjwD0=; b=zyL5tvX4rBCO7VhGutk2GUjzFt
	rNtMLqL2PCSeDaDvI1Ty4LVLc+N8wHJg/vJhDCT0+p2QiJqk2zQuLdTgkLcz5eZnI4VgSVHZ9pGwe
	Ar6zpyLrtpvybJ0cyyxutsVo8x8XRvBijOU3XFOxWyE1BRkqwuJAwaq/nE26KQ2CZ39fOZhMHlhUN
	7ASYYl93NiUptvjt4VVYdIsgkBaMm8mAThCNiVVuUUO++/6STPehOXM8ezLO2TURVuqEwZs0i1hPQ
	qlEcugFtz/xRbNb85uV1cXtpvxzU5ALb/Ee9refC6ddi6yFw9hqPMTmRPiDr56b09ZUEXygHG+F+5
	UJRMiLlA==;
Received: from ip6-localhost ([::1]:64224 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1mFvyk-006qcY-77; Tue, 17 Aug 2021 10:05:54 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:27864) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1mFvyd-006qcP-88
 for samba-technical@lists.samba.org; Tue, 17 Aug 2021 10:05:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=2Cbt3J02G5bNukFchEMglwRe5OLuqbNArR3utjXjwD0=; b=MtX9Oqx7/OQoqs+ewzcLS60ymP
 fjGCvpL2h/2jQmvQFxLyIJnIpLtyszr9RH7RMtizWzuO5S/EmUahW/EO4lvMHSCoJ+sKG+C1Kp84h
 rR769VOmDq2QKzNwOR/rRH6s8Q+ZlCFIPmm91+VPDLnd5uHZh/UVYWby7nsQC1m5d0j71sV7+dVeK
 cuEeH7Ebt574MfBD7yeaM4iQwsEvW+CwKTz4zpKOAX3kk42MR3JdCzIm3cUSqgbj6baCCEPuknUe9
 8pzo36DsKxtNia0RO7CWnmLn4FytmIqicp6XuWg3ApsTwumMxNM7UPGbbSvoIFZKeRh3OvhbEj4dk
 VL9iAcNs84eMmuYYHKHjJPUho28A696YPm10NkV5ESkoh5V9mR0pOEG0zo4iN0nQo/n8SMgZ6f/s7
 9vpsNOyuJNROrWkLD25zdtCYa9G5j83ZnBIHio2Elz84y0iHdiSVUvNgqgjFOy5vJ6mVA39E6o8lk
 9qvac7wGgz91+HIJ9sUOjYvi;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.2:ECDHE_SECP256R1__ECDSA_SHA256__AES_256_GCM:256) (Exim)
 id 1mFvyc-001hWh-B3; Tue, 17 Aug 2021 10:05:46 +0000
To: <samba-technical@lists.samba.org>
References: <!&!AAAAAAAAAAAYAAAAAAAAAGDYSmKIm/dOkx5/FTTl6NSCgAAAEAAAALDNuoTUz2BEvIzum5zYFuMBAAAAAA==@sapo.pt>
 <vmime.611b5f41.4750.487454c74d69d4d1@ms249-lin-003.rotterdam.bazuin.nl>
In-Reply-To: <vmime.611b5f41.4750.487454c74d69d4d1@ms249-lin-003.rotterdam.bazuin.nl>
Subject: RE: [Samba] wiki returns ERR_HTTP2_PROTOCOL_ERROR
Date: Tue, 17 Aug 2021 12:05:46 +0200
Message-ID: <50723624B2174306814C9DA7FE8ECFFD@rotterdam.bazuin.nl>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Office Outlook 11
X-MimeOLE: Produced By Microsoft MimeOLE
Thread-Index: AdeTNfslOrYLDmeCQ6Oz5C5dQg5GngAGWNXw
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
From: "L. van Belle via samba-technical" <samba-technical@lists.samba.org>
Reply-To: belle@samba.org
Cc: 'Andrew Bartlett' <abartlet@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Wiki works again here. 

Who ever fixed it.. THANKS!! 

Louis


