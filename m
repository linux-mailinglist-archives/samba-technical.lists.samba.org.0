Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 247CE329F98
	for <lists+samba-technical@lfdr.de>; Tue,  2 Mar 2021 13:54:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=5RLKDY4Lu4zoF4ayt/DQ0yRTHcyVuSEvssrV6nEvFwM=; b=0U8C2hEkEqvodBpPlooFhPIQ3g
	GVqngNq7ntiV4vG9yCJ4lvR6CiWe8dt5Mt91gL4timDyhUaD9ljrXekmeo6rd4OkUovXyke8Wj2EK
	bYInBhhcaxXZXDMO2RlD3fGAJ7AyNeWMr024dNvHxloU7ydL9hnH0JXtD/lCa9wWodMHHUXnCkZe6
	frhjUYVFUD69eLsn90eNucLpN9goMvN9Ad5afIXLP4xiVODGNe/GpJBNZEIronU5qQKB4cbm+iCDt
	VfzB38jnNi580fO2lxTWR9K0xNgK6QojPsQUh3M1tU5Zoj60gChXrwOLHamKcEzox8VuJaBar1JmO
	rnRTuPog==;
Received: from ip6-localhost ([::1]:27906 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lH4Xn-003qvM-R7; Tue, 02 Mar 2021 12:54:31 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:44002) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lH4Xi-003qvF-Hy
 for samba-technical@lists.samba.org; Tue, 02 Mar 2021 12:54:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=5RLKDY4Lu4zoF4ayt/DQ0yRTHcyVuSEvssrV6nEvFwM=; b=Fc0Eu+LxWY6ALuwW6o+yIyh531
 yuE00oO+Ryfnzz4b3wMe9lHjdPi7p9tsUt9jKhBkFCp6pfRTp4GKwV4307rNrYESWz7ZGRR91Hano
 76ujs/hlLr28sW4ybSvZfJNCoCjFE40bUhDvQOhTot93apX+bsMVaNtn3J9F6EByQoUKnXusa4khB
 yOo2ANER0Kdj7nyteOK2cJRPXkNk2Pk9MflkvOkkPHOvtUpdBv+plKnjxRsbqcj+Tw6xYWttGdph9
 flA5xp0RfD/g2BJFBQmR3xh9hRkp1ICq5gdPU8MbToANr81s9nxvZo4VVIkRGblJViZnmzszAImeI
 9Hvxn20EkHrFD2O6m+Jwdmgu1Lz0cU9tkeTLwqaYcfbhFn6Yog5uU0tLd0Lpp80RDVEw8WTpnT8iw
 7ZUeVaE3vLwI3g43rJdwJMFkLBGEi+rOwQmgs8QusMFOjkwWRczfyOs8odnjo+OTN+Ph2aVsK/wRF
 /d/dFNnq5Ae4xrwRuf/D4J9f;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lH4Xf-0006Jr-6W; Tue, 02 Mar 2021 12:54:23 +0000
Date: Tue, 2 Mar 2021 14:54:21 +0200
To: Vikram Bharti <vikrambharti33@gmail.com>
Subject: Re: Kerberos Constrained Delegation in libsmbclient
Message-ID: <20210302125421.GA5029@pinega.vda.li>
References: <CAH_vq2Hx+RzJoudmxcECe0PXG7uGvydzJceWm2nMEX0C5naV6w@mail.gmail.com>
 <20210224182956.GC1333267@jeremy-acer>
 <CAH_vq2HzC9T8FNc7khndkPa_uOTxOh9B94sU7TiN5zn0G3Ssmw@mail.gmail.com>
 <CAH_vq2GPk+tKkc2UWLYPA1KyW5j7KjWbg373jNi8397a2n=wVw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAH_vq2GPk+tKkc2UWLYPA1KyW5j7KjWbg373jNi8397a2n=wVw@mail.gmail.com>
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
Cc: samba-technical@lists.samba.org, Jeremy Allison <jra@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On ti, 02 maalis 2021, Vikram Bharti via samba-technical wrote:
> Any further help would be appreciated.

As far as I can see, libsmbclient internally uses credentials API which
means it already should support constraint delegation.

I am not using libsmbclient for this use case myself but in FreeIPA we
are relying on Samba Python bindings for constraint delegation-based
access to LSA RPC and we have no problem with credentials API.


> 
> On Thu, Feb 25, 2021 at 5:28 PM Vikram Bharti <vikrambharti33@gmail.com>
> wrote:
> 
> > IMO KCD can take service user, password/keytab-file, UPN of impersonation
> > user, and SPN of service as inputs  (probably in auth_callback)
> > or it can take final service ticket (TGS-REP) as input in auth_callback.
> > Not so sure what should be right the way but I leave it up to you decide if
> > these 2 are feasible or if there is a better way.
> >
> >
> >
> > On Thu, Feb 25, 2021 at 12:00 AM Jeremy Allison <jra@samba.org> wrote:
> >
> >> On Wed, Feb 24, 2021 at 05:29:37PM +0530, Vikram Bharti via
> >> samba-technical wrote:
> >> >Hi ,
> >> >
> >> >I was exploring a way to get KCD work with libsmbclient APIs and i see
> >> >libsmbclient supports Kerberos auth but can't find any API for
> >> >impersonation and delegation.
> >> >Pls let me know if there is a way to get it done.
> >>
> >> No, this is not currently available in the libsmbclient API's.
> >>
> >> Can you give an example of what you'd like this to look like,
> >> so we can assess how hard it would be to implement ?
> >>
> >

-- 
/ Alexander Bokovoy

