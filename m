Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C50F857BE0
	for <lists+samba-technical@lfdr.de>; Fri, 16 Feb 2024 12:40:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=ALflaSMyoPaDXjDrHKt8Y2WKYeSTLev0xW38K0LsUFg=; b=OpBd8xhR11GihxrYf2AHTAF8sg
	NAZw5E0sSneNG9CCrQEoTrHb2Xf3KIi2ZJ+Wt2UDSUdekwgIStenhC0YV+BhwyUDzZRxRg01p5M/B
	WeOpcHHDJ4j9qWUVBiQsnHvR5j//h+GYcFGaRuPLCY+3sb/tV83gaUvDdv1OaKv8n5JBNRcT4y04u
	MAhcvYzLRaCl69MNbUXfRo/S6nKnwE5sLJk6SBMe7osafmQ9apGfjw3AC8Yb4OOjl2xHb2zK/7+uJ
	Akab1IhCN+wAyJD6WW8/gr9NfmV7G/MAoABHrIgcTPKzyvmnE+ItBecuVU7RK7DnsN6/TBQLU6Jmd
	GnKHUSNQ==;
Received: from ip6-localhost ([::1]:52738 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1rawa1-008goZ-Dx; Fri, 16 Feb 2024 11:40:33 +0000
Received: from mail.sernet.de ([2a0a:a3c0:0:25::217:2]:33555) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rawZw-008goS-P5
 for samba-technical@lists.samba.org; Fri, 16 Feb 2024 11:40:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sernet.de; 
 s=20210621-rsa;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ALflaSMyoPaDXjDrHKt8Y2WKYeSTLev0xW38K0LsUFg=; b=UNVK/BQe3XINAOFBw+KQpiaCQc
 4hGpG5PBRRy+cmdNQGhhFTlv5g2o1VUpDfcVzwsopru+ZZkbxZ6WIk4rgdb1VaHNH4oIYJ/1gKHck
 oYySCuUQlAOMStwDTaNdsuNG7DZZNIxEyowfXbgNm/Vd1o25gjCeX4b/VdlFS+YPVnPEHrQtonwLA
 5gD+GYW66OpJQGy4weWtscg/E9UsN1TK02wMFzXM9vyqH7W9z8ujlfPco8bhSOPHZZr7ajcG6WY4Q
 jlPt03SAcDGQd2FvGNOgWzZxY1RMJ6TlNNQ+Z9KRKqT1joU7Ta6xqKAPP04YvtegDkADJSTxCr72P
 UWGHlPiw==;
DKIM-Signature: v=1; a=ed25519-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sernet.de; s=20210621-ed25519; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:To:Subject:MIME-Version:Date:Message-ID:Sender:
 Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ALflaSMyoPaDXjDrHKt8Y2WKYeSTLev0xW38K0LsUFg=; b=vwUzeC9oLBe5DkonukVaGMOr25
 GLjiFw/zn0pxuo3kMsTEEkiiSNDGG8AqcIfX3iL0xHkDVPr2po9iVZHFLpBQ==;
Authentication-Results: mail.sernet.de;
 iprev=fail smtp.remote-ip=185.199.216.40
Received: from intern.sernet.de by mail.sernet.de
 with esmtps (Exim Mail Transfer Agent)
 id 1rawZt-004Yg6-53; Fri, 16 Feb 2024 12:40:24 +0100
Received: by intern.sernet.de
 id 1rawZs-001ZKg-GQ; Fri, 16 Feb 2024 12:40:24 +0100
Message-ID: <e75610fe-7479-4057-b48f-f207711f6c0a@sernet.de>
Date: Fri, 16 Feb 2024 12:40:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: smbd: Broken access to share
Content-Language: de-DE, en-US
To: =?UTF-8?B?0JrRg9C/0YfRg9C6INCc0LjRhdCw0LjQuyDQk9C10L7RgNCz0LjQtdCy0Lg=?=
 =?UTF-8?B?0Yc=?= <MKupchuk@inno.tech>,
 "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>
References: <c4ef9c77c4784a1898abdd266e5dccb5@inno.tech>
 <ec8cb899-c1e7-45bd-97c9-a8d57f2c2fa9@sernet.de>
 <4b79869d3da4448096bc54491dcb4bec@inno.tech>
Organization: SerNet GmbH
In-Reply-To: <4b79869d3da4448096bc54491dcb4bec@inno.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
From: =?utf-8?q?Bj=C3=B6rn_Baumbach_via_samba-technical?=
 <samba-technical@lists.samba.org>
Reply-To: =?UTF-8?Q?Bj=C3=B6rn_Baumbach?= <bb@sernet.de>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On 2/16/24 12:14, Купчук Михаил Георгиевич wrote:
> -#if defined(HAVE_POSIX_CAPABILITIES) && defined(CAP_DAC_OVERRIDE)
> +#if defined(HAVE_POSIX_CAPABILITIES) && defined(CAP_DAC_OVERRIDE) && defined(CAP_DAC_OVERRIDE_FIXED)
>   static bool have_cap_dac_override = true;
>   #else
>   static bool have_cap_dac_override = false;
> 
> which in fact disables all that "prefer capabilities over become_root" commits set,
> Our problem goes away and everything works again.

Seems that there are several related issues. Yesterday I've filed this 
bug, which is also related:
https://bugzilla.samba.org/show_bug.cgi?id=15583

Best regards,
Björn

-- 
SerNet GmbH, Bahnhofsallee 1b, 37081 Göttingen
phone: 0551-370000-0, mailto:kontakt@sernet.de
Gesch.F.: Dr. Johannes Loxen und Reinhild Jung
AG Göttingen: HR-B 2816 - http://www.sernet.de
Datenschutz: https://www.sernet.de/datenschutz

