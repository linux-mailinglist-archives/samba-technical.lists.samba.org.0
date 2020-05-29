Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B24591E75E0
	for <lists+samba-technical@lfdr.de>; Fri, 29 May 2020 08:25:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=4kT+srvfzY5lKU+xfT2AKGp3kGRTEBpWiYRNZg4A6C0=; b=ykWWEuhpmuU+e+C5HhulQtnL1y
	Rh8ymlHmlR02+C7h+L1UTvVHeuhfgy9tNXFCVe2/i5kIktVHHOx17GjjlV6wowXio/ZFBBp3ffN1y
	Li7u/4Av1BWSlMnOZa70yDYP0sd35LkeJOZi1AG8uFNZZgx+Gn3+e2S20yA9UQlsg6fGTcpbbq1cd
	HzENMwGP26jdIDgMapOHhwBKwGthFiGb/XUVbpfjPlIIZTp9TzA6FxZfYx2bU/2K4sFonD89YDkCB
	htfteTmyu7/cOWLAbCBRP93LB++QM42Wf0swhM2xaQDNPpImIUkHizT1x6XrZPhe2qgNjGteWoi6c
	8UEfoJKA==;
Received: from localhost ([::1]:53810 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jeYRp-006Iul-IC; Fri, 29 May 2020 06:24:53 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:58472) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jeYRl-006Iue-9T
 for samba-technical@lists.samba.org; Fri, 29 May 2020 06:24:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=4kT+srvfzY5lKU+xfT2AKGp3kGRTEBpWiYRNZg4A6C0=; b=aongrm/AyDQPzKb4H//JKRVRgZ
 DLiYRag/D4ubU63XbFMFHEJBAVH0IsWjZBdPI5TqS8TCrDhtj3TJ4hvSLZw3qDD89sVQQbH41XN2n
 XHnUsA5k8Nvu0xdI3rAcniw/c15rJa4BL71FuADfEqt6/yts1l32YD430zh5nWR20r9avwm17HwJg
 62zraxJ1EMVEfSOk/FqSluofttalm0DwUbUepe9HHMcwN3oKKimgBefN7hjEi6jR0RoB0LjMLwtxM
 c0cplHDf85bf5GcXPpgIsr681iXlDs6JA3YssJblAPl2MrWmoQaRtZwsUWelorX+Lp3RzyHBMlVS5
 pt/iIyyVVgbXkV5JHRkLHjyNv4tz1wbEaHvFyUInmLxX6E+PfV0h2Y7uU1WhKVSmYYGVgLSVK6pAd
 wUxwGedjp9IMs4qZazYH94+Xt3/My7HY7MuKsT0jA7atyZu5tDrf6qw/LaG47GLYuSrVSi4e9zvn2
 rTDuyBnThBOsPygM1bPKi/tj;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jeYRj-0002Bj-Mt; Fri, 29 May 2020 06:24:47 +0000
Date: Fri, 29 May 2020 09:24:44 +0300
To: hezekiah maina <hezekiahmaina3@gmail.com>
Subject: Re: Checking if Samba is running as an AD DC
Message-ID: <20200529062444.GP5779@onega.vda.li>
References: <CAH72RCXPNq2R6p7G61OCztSrdZrqXO6G5L4azhUSgQxqT50K1A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAH72RCXPNq2R6p7G61OCztSrdZrqXO6G5L4azhUSgQxqT50K1A@mail.gmail.com>
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
From: Alexander Bokovoy via samba-technical <samba-technical@lists.samba.org>
Reply-To: Alexander Bokovoy <ab@samba.org>
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On to, 28 touko 2020, hezekiah maina via samba-technical wrote:
> Hello everyone,
> 
> I want to first express my gratitude to the entire Samba community.
> You have been kind and very responsive whenever I ask for help or advice.
> Thank you.
> 
> How else should I check that Samba is running as an AD DC apart from
> looking at the smb.conf file?
> Is there a process that gives me this kind of information?

For Cockpit integration you need to use systemd services to check
whether a service is configured and enabled/started since that
environment will anyway have systemd configured.

systemctl is-enabled samba
systemctl is-active samba

For the config file checks, you can use 'testparm' utility:

$ testparm --show-all-parameters -s|grep 'server role'
server role=P_ENUM,auto|standalone server|standalone|member server|member|classic primary domain controller|classic backup domain controller|active directory domain controller|domain controller|dc,

On non-DC system:
$ testparm --section-name global --parameter-name 'server role' -s 2>/dev/null 
auto

Checking configuration is needed anyway because you get information
about the actual server role, not just that a service is running.

-- 
/ Alexander Bokovoy

