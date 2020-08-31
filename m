Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 854142579C7
	for <lists+samba-technical@lfdr.de>; Mon, 31 Aug 2020 14:54:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=JSIgaW4lwYPz5FrVVBL7J4BssaFXDJI3kmZr7XCu+IU=; b=KgPELapTpptmF6t2zYtTFMCR9x
	RANrmhi8bSSbYdijkveEbMmDtOm4Jm9bKTODdWdn3Xe7F5ObiCj+jpJMARJDlL+Lehv/KKVImHH8N
	MGgLXMswQ0rMPN7X88H9nrRx3LivRwZrUMWfakfnBTfMLai0CVwSZTWhlEv/7tYyNDsSegLX1GhGo
	rK9q3JE01T7rJpT6keW5E0SkhlbLdYc9JDSlwlcpPtRV+Pqwzjn1+tvqAlLkD15edqrHdFUDBPzDe
	RBowzRTHooUJEgKiRVYc4QXZOxWjDu3s9Ww/5G1aN3ppaioH3U4HhD4zuYYhdC/VjU9h5c+VKILeL
	gty9X8Mw==;
Received: from localhost ([::1]:63562 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kCjJP-001R83-J1; Mon, 31 Aug 2020 12:53:27 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:22670) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kCjJK-001R7w-13
 for samba-technical@lists.samba.org; Mon, 31 Aug 2020 12:53:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:To:CC;
 bh=JSIgaW4lwYPz5FrVVBL7J4BssaFXDJI3kmZr7XCu+IU=; b=NGji/kgU6nFrfUOmP9R0zH/q7r
 9kNODxifzHCswlOGMn6pF9mUJT5BxHL2NOyZS9boaIykXFjUZ0xT+cbRPJAm8bynFwssU9rQO23rx
 bvdNe1mt3WtuKJrwjMXWhvPQV3LLYlUZMEIX2pFY0QxHCLDZtj+3y6zrCIMVK/K1tcZiT0Spknkb6
 RDs8WCWP4w06x61cd5P95AmBbBs0lVJU28mn8xiQv11ZL8pwcC6P8nWvTcX0XyL8V7+uiDLEoVkGm
 RmrcM+evqfZTO0n+8i/1N8VGc5yoRvFAuE/1WOy/nJXju0vowwASejXy4OELEkX77sWgqKK3a60oU
 oPMriRPSSKFOZpnkx/ABSA/dpsCxuuSR3FddvVqK2DtxyJl0a9NORvWUdEyVGGzOxbCye3clI/EvV
 LKF2iiUKAecV4ti19OY84QPLeUeD+t2mwicQe4qO/6Cavfg4oQ/wMZNnH++i6ojoGffhLcovLiFP9
 N967yhz29goWO323R1x1zmv6;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kCjJE-0002QF-2D; Mon, 31 Aug 2020 12:53:16 +0000
Subject: Re: PATCH: make disabling of vfs_snapper consistent with our
 configure/build system
To: Andrew Bartlett <abartlet@samba.org>, samba-technical@lists.samba.org
References: <20200710110737.GA1585556@sernet.de>
 <b4ea37e5-398d-c8d2-15e2-1a27f7655598@samba.org>
 <20200710114452.GB1572444@sernet.de>
 <54f90e98-9d7a-337e-defb-27fb756130fd@samba.org>
 <20200710194428.GA1596727@sernet.de>
 <63044415-9473-1572-2cd5-fa1fa5e012e1@samba.org>
 <20200720170142.1583649f@samba.org>
 <15eadeabe4d9fc23e9a311a51a007fa020781ccc.camel@samba.org>
 <20200812115841.GD272474@sernet.de>
 <38124182-985f-8a79-aa9a-1cbb2241dc3f@samba.org>
 <951676ca1d57de76f0a5494140ebdc985b607731.camel@samba.org>
Organization: Samba Team
Message-ID: <aa86e306-0c2e-763c-bb4c-3ba9fc4a9d52@samba.org>
Date: Mon, 31 Aug 2020 14:53:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <951676ca1d57de76f0a5494140ebdc985b607731.camel@samba.org>
Content-Type: text/plain; charset=utf-8
Content-Language: de-DE
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
From: Karolin Seeger via samba-technical <samba-technical@lists.samba.org>
Reply-To: Karolin Seeger <kseeger@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi,

Am 31.08.20 um 11:52 schrieb Andrew Bartlett:
> On Mon, 2020-08-31 at 11:36 +0200, Karolin Seeger via samba-technical
> wrote:
>>
>> this is currently a blocker for 4.13.0, so we need a solution asap. Can
>> we agree at least on a temporary workaround?
>> Or on shippting 4.13.0 anyway?
> 
> I'm lost as to why this is blocking 4.13, can you give me the short
> version?
> 
> My understanding is this:
> 
> I get that Björn would like to change our mostly-but-not-entirely
> consistent position from 'all features on by default, turn them off if
> they don't work for you' (since Waf was introduced) to 'auto-figure
> what the system has' (what autoconf traditionally did).   
> 
> I also get that we have not been entirely consistent.
> 
> But we did Waf, and much of this change, back in Samba 4.0 so why is
> this blocking the release at 4.13?

The point with 4.13.0 is, that the !snapper in the vfs module list does
not work any longer (and it does in 4.12). It has been broken by commit
7ae03a19b3ca895ba5f97a6bd4f9539d8daa6e0a.

Additionally, Samba does not build by default on many non Linux
plattforms any longer. The auto dection mode "build if possible" is very
nice for vendors.

Can we revert this patch for 4.13.0?

Cheers,
Karo

-- 
Karolin Seeger			https://samba.org/~kseeger/
Release Manager Samba Team	https://samba.org
Team Lead Samba SerNet		https://sernet.de

