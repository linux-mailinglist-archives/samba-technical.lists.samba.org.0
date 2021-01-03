Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D9DF2E89C1
	for <lists+samba-technical@lfdr.de>; Sun,  3 Jan 2021 02:21:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=AmrtMhwOE08jj+9ACyWNKhbh+Veh3K5d8FAJN7NwnDs=; b=fN0xIw6Nx8c9kRsAsNaf+mw/b5
	ctd8ltO/rxNpn6IlfqqvFVhH7vIwHfAx4aUspRaksx4meFWRLbgSvsWJJdAkK9lPUM5tCFdG6rixi
	pJECDrjENyjmQHa9vRcIcOZk6cy56KDeQSqO2ty1woESZ0HAsR8o+9ISDwzx4xiwJzudM2ccYXSQz
	qBehjSEFBZNBTUfeQqNa2J72xUx2zGgJUlB9+zF1VuiwNNbx8RzuF+PUB0GAi800lQ8Ow+IRlpfcL
	PinDi37K7gzvnHYdpKErpzayqJ4zeBbZPh4cRNYBgKwzikZFS/NnW8re6j6DIWafU8RRt9AgWYvtt
	IdnVOIoA==;
Received: from ip6-localhost ([::1]:28678 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kvs5F-004bau-UW; Sun, 03 Jan 2021 01:21:26 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:30060) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kvs5B-004ban-5i
 for samba-technical@lists.samba.org; Sun, 03 Jan 2021 01:21:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=AmrtMhwOE08jj+9ACyWNKhbh+Veh3K5d8FAJN7NwnDs=; b=C9H+ijbMp4XiAzhFLjzf1mGgq9
 lRyTDY/wt9MTYJ30lai9hGem7MV59yklm0TX21ir1sTUSX64w8DazHCYz9UKeAfHkmvVNxwBy4i4n
 9durNxZiDnP6eSRJley2DwuA97UaLzeUDUcyCKtC0MAwka12V4wwoQ7mJit8cz1i9sCzSiGLxiGdU
 hScwdePOMjSaok9Um2/mP83U9NAwZXCKvIK8fAVF+fMbHGF/VEvSw2iPo4BG0ZTi/MmRcxwanZGWf
 tb2r/wqldkXdyud41CHWFKOnCQxJenWDxTyWCRedPpacHdG9YHcJcumZqJXlL2ROfVs+0XYTmkiVX
 SiJPF4dcrvxVpz7ONn34lTgyQpKSbbj0PVXe0WcqrhksbkAoZWdDsPCUAtbCOGTqcu8DXL6flc/GI
 ZcRvxItYylS7QxVqQwu3cE/muoB0yTdGbg5zo7v+gq27kHmm3VK0Ow8uwWJIpRhwGexa1Vc+EOqUn
 jUH03KPzwyFv1n0SP9thMeE7;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kvs58-00052J-Tp; Sun, 03 Jan 2021 01:21:19 +0000
Date: Sat, 2 Jan 2021 17:21:16 -0800
To: Steve French <smfrench@gmail.com>
Subject: Re: [PATCH][SMB3] allow files to be created with backslash in file
 name
Message-ID: <20210103012116.GA117067@jeremy-acer>
References: <CAH2r5msH3LZuF69UFcfgtG7XXurMDc=-Ab7Ct4XwfARR8d+wRA@mail.gmail.com>
 <20210101060050.GA1892237@jeremy-acer>
 <CAH2r5mt+5LQB59w0SPEp2Q-9ZZ2PV=XDMtGpy2pedhF8eKif0A@mail.gmail.com>
 <20210101195821.GA41555@jeremy-acer>
 <CAH2r5mvt_cHDbT0xaeLNQn=5cQ0T2-wPgpMkYEGQNdtDZ3kP=A@mail.gmail.com>
 <20210102025837.GA61433@jeremy-acer>
 <CAH2r5ms1V2KKb6T3ELQ-JsQ3fniOScTE2654_xLwnPruiekzEw@mail.gmail.com>
 <20210102052524.GA67422@jeremy-acer>
 <CAH2r5msZt0UZG5r5Z7=_jQf=-xgNz8zW7fZOnqncqeJHB=mOmA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CAH2r5msZt0UZG5r5Z7=_jQf=-xgNz8zW7fZOnqncqeJHB=mOmA@mail.gmail.com>
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
From: Jeremy Allison via samba-technical <samba-technical@lists.samba.org>
Reply-To: Jeremy Allison <jra@samba.org>
Cc: Xiaoli Feng <xifeng@redhat.com>,
 samba-technical <samba-technical@lists.samba.org>,
 CIFS <linux-cifs@vger.kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Sat, Jan 02, 2021 at 06:19:39PM -0600, Steve French wrote:
>I agree with the idea of being safe (in the smbclient in this case),
>and not returning potentially dangerous file names (even if a very
>remote danger to the tool, smbclient in this case), but I am not
>convinced that the "user friendly" behavior is to reject the names
>with the rather confusing message - especially as it would mean that
>inserting a single file with an odd name into a server could make the
>whole share unusable for smbclient (e.g. in a backup scenario).  I
>agree with rejecting (or perhaps better skipping) it, but ... not sure
>any user would understand what SMBecho has to do with a server file
>name.

Dropping the connection on receipt of an invalid
name is the only safe response. We know the server
is insane and dangerous at that point and sending
invalid protocol responses.

Safer not to continue.

>"NT_STATUS_INVALID_NETWORK_RESPONSE listing \*
>smb: \> SMBecho failed (NT_STATUS_CONNECTION_DISCONNECTED). The
>connection is disconnected now"

The SMBecho is due to the keepalive failing once
the connection was dropped.

