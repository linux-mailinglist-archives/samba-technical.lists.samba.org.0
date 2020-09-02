Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 1128A25A990
	for <lists+samba-technical@lfdr.de>; Wed,  2 Sep 2020 12:37:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=llEsIESqhbXba9AkGbDTXA5f46SRMJ+k1cB/tcnPHUs=; b=NytK/GdXoK2Mn4eJUPCb5+WYel
	Zl+kF2PChlz59HgvqpEPBgBGhOMDaMfpZaDYzmnSbuoVdLZOFCtvIfjE9D+CJpEOWoCs5P9KndxlN
	94bSTm5dodSnZ3dnj5CgZSo8hTgDlRpT4N+3jEUt55g52Qlzf/5jIBi8QokJlP+NcsdkuQ3G8sxf9
	LXaxc2fLrIWM4yFU+lLlGSH/s7jmUzFPWBjU4/hxalYkhveb3YW2+UiPOAdbK1zy31HF+2X6UJ8RN
	isOeaoFOc74BRkVzTso1DedZf4nHvhFpWMf5aNtiwzFq8tfbRIv8kWXwfLm2qIUIMc4E93xJgEHiw
	4G6+yFCg==;
Received: from localhost ([::1]:45120 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kDQ8P-003Upk-Al; Wed, 02 Sep 2020 10:36:57 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:55732) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kDQ8I-003Upd-M9
 for samba-technical@lists.samba.org; Wed, 02 Sep 2020 10:36:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=llEsIESqhbXba9AkGbDTXA5f46SRMJ+k1cB/tcnPHUs=; b=i1D3Bzvo3AdYu2PLQDRAvDrK27
 cjXDcUoTbcOvwO/XiI1OTEwDNE57c7hNVIWTAMa8YSwwYo/OBiA59zibxONKPAdQZWMV86JFOoNO+
 9MVyiqrrOunHrZpf9O9zqiq2xoDqhn3zwgd0NkKojtugSF3IMBHrPEzIoku1MtnplSO6xoa61OC9V
 mDF5G8ROySsl7FkxWcdSp+kXsg6AkGxitEZLxSjDRZOD/KWKfl0rndo+NAlxPgRutMImAg4DIHutR
 Chh23BecGRDOeJDAuDywGEcTeOEEPmMgm2JdwkL+prAk3CShyjz5t969wGamfAUvDvN7h6JaS9QWc
 /XCjnvJIQYSWqgNNXdfic2R6pr3r0IZqoYF+rUSraSw3+VSc1+yF1hnQPkwj3eh+xXnDLxqgXEw0J
 kx854utn4h0Ue9LWhy+9sxqFey7TTLvoraUz24h/aTU24VYL4TBDBvPAdRDnulgWDGS6SURPKVf7g
 Ub76LODcFsSGQAhMJtU1JdGi;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kDQ8H-0001nG-Gd; Wed, 02 Sep 2020 10:36:49 +0000
Date: Wed, 2 Sep 2020 12:36:48 +0200
To: =?UTF-8?B?QmrDtnJu?= JACKE <bj@SerNet.DE>
Subject: Re: PATCH: make disabling of vfs_snapper consistent with our
 configure/build system
Message-ID: <20200902123648.6d8aa3a9@samba.org>
In-Reply-To: <20200902095042.GA800820@sernet.de>
References: <20200710194428.GA1596727@sernet.de>
 <63044415-9473-1572-2cd5-fa1fa5e012e1@samba.org>
 <20200720170142.1583649f@samba.org>
 <15eadeabe4d9fc23e9a311a51a007fa020781ccc.camel@samba.org>
 <20200812115841.GD272474@sernet.de>
 <38124182-985f-8a79-aa9a-1cbb2241dc3f@samba.org>
 <951676ca1d57de76f0a5494140ebdc985b607731.camel@samba.org>
 <aa86e306-0c2e-763c-bb4c-3ba9fc4a9d52@samba.org>
 <20200901104311.GB760902@sernet.de>
 <20200902112132.1f7f4c79@samba.org>
 <20200902095042.GA800820@sernet.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
From: David Disseldorp via samba-technical <samba-technical@lists.samba.org>
Reply-To: David Disseldorp <ddiss@samba.org>
Cc: Matt Taylor <liverbugg@rinux.org>,
 =?UTF-8?B?QmrDtnJu?= JACKE via samba-technical
 <samba-technical@lists.samba.org>, Andrew Bartlett <abartlet@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi Bj=C3=B6rn,

On Wed, 2 Sep 2020 11:50:42 +0200, Bj=C3=B6rn JACKE wrote:

> the topic of enabled or disabled or auto by default should actually be a =
split
> off discussion, as this discussion cannot be finished before 4.13.

I agree, it's a separate discussion.

> I mentioned before that I object that we introduce more enabled-by-default
> options, which need to be explicitly disabled on all other non-Linux plat=
forms.
> See by mail from August 12 for more details on this.

Please see the gitlab patch discussion. The new patch disables the
module by default on non-Linux platforms.

Cheers, David

