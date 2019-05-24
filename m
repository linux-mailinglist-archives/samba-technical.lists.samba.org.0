Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 92B90298B6
	for <lists+samba-technical@lfdr.de>; Fri, 24 May 2019 15:16:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=NSe0jTdWcOrCzCNlDrZ60H7S/FgK23ntBqPpIUtSdps=; b=AQtvyG+4xywxz4kd0igwUGAxl/
	QQ+qKEm6+rWeBs77GPI+4cZq2JnYSGjC3qzUY0GFR81x2pYIE7uELTgmQlIrJGVzgysI7FVXOrz+L
	iH0W0kpYGqQ0Loxr/i9kx4WPjfPcRD7tlxoA8PiqmIPT8hvZ4zK4M5xqAt/zgWMl3VxPSQ2nuFNOH
	jFVMxL4I/2PnYGIjuplyuZLvXfX6SFaRmtnWN5wYLD7m8oGj7ZGH42wssa7vICggNeOvA8hPGokdP
	BgQzCvzrmhCFP/bKHAYvXx3OQFv6EmeT86OuHRZxbW1kiMZ9JNlCJDGJHCJjmHhzCKPrf/pMNaj/m
	URUg6NDg==;
Received: from localhost ([::1]:56254 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hUA2o-001abn-GJ; Fri, 24 May 2019 13:15:34 +0000
Received: from [2a01:4f8:192:486::147:1] (port=21466 helo=hr2.samba.org) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hUA2j-001abg-Vt
 for samba-technical@lists.samba.org; Fri, 24 May 2019 13:15:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Message-ID:Cc:To:From:Date;
 bh=NSe0jTdWcOrCzCNlDrZ60H7S/FgK23ntBqPpIUtSdps=; b=raUmvMHd5BngkHaK4WuMRGy29z
 f0wKvD+9npBn8CX0KfwTSEPHOsaPL3lC6QXOSQJiN7xJ2bqM3gNKarqqE+GkCEniuM/FTsmt7YMw2
 xFWsuChbuYyKsMIgQqN99ABcmpeV2AZoXuoGZtDoBr5cEHfIa5QxIGs8HTz1AMkKSsw0=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hUA2a-0001dR-B2; Fri, 24 May 2019 13:15:20 +0000
Date: Fri, 24 May 2019 15:15:17 +0200
To: Amir Goldstein <amir73il@gmail.com>
Subject: Re: Better interop for NFS/SMB file share mode/reservation
Message-ID: <20190524131517.5i3c63fytz3jansf@inti>
References: <CAOQ4uxjxQoCWqfp+f91--tyR81PREsssT=RV9uRgCQFs+yk7mw@mail.gmail.com>
 <20190214210652.GC9216@fieldses.org>
 <20190305214748.GD27437@fieldses.org>
 <20190306151150.GC2426@fieldses.org>
 <1ade4724a4e505baf7b7c23a76e44d58b931da1f.camel@kernel.org>
 <20190306210743.GE19279@jra3>
 <F00A0481-0AC7-411E-8353-BF104713F524@samba.org>
 <5ebdb58b-26d9-c0f2-bd67-883bc4678ac7@samba.org>
 <CAOQ4uxiBLw_L=SqCjLU6W60LbtWiLaBh=5Cb4HnSAFqCW0z1WA@mail.gmail.com>
 <CAOQ4uxiJQj+wvL8UxfDWe+BAD_7cmHBa5Z3L5Gv0LaDc2TKgUg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <CAOQ4uxiJQj+wvL8UxfDWe+BAD_7cmHBa5Z3L5Gv0LaDc2TKgUg@mail.gmail.com>
User-Agent: NeoMutt/20180716
X-BeenThere: samba-technical@lists.samba.org
X-Mailman-Version: 2.1.23
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
From: Ralph Boehme via samba-technical <samba-technical@lists.samba.org>
Reply-To: Ralph Boehme <slow@samba.org>
Cc: Linux NFS Mailing List <linux-nfs@vger.kernel.org>,
 devel@lists.nfs-ganesha.org, samba-technical <samba-technical@lists.samba.org>,
 Jeff Layton <jlayton@kernel.org>, Stefan Metzmacher <metze@samba.org>,
 Volker.Lendecke@sernet.de, Trond Myklebust <trond.myklebust@hammerspace.com>,
 Jeremy Allison <jra@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Fri, May 24, 2019 at 10:12:10AM +0300, Amir Goldstein wrote:
>I will be attending SambaXP, so if any of the Samba guys would like to, we could
>find a slot in the Hallway track or at a local bar to discuss those options.

awesome! I'll join as well.

Looking forward to see you at SambaXP!
-slow

-- 
Ralph Boehme, Samba Team                https://samba.org/
Samba Developer, SerNet GmbH   https://sernet.de/en/samba/
GPG-Fingerprint   FAE2C6088A24252051C559E4AA1E9B7126399E46

