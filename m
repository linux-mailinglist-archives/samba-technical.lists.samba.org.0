Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 12C082A0070
	for <lists+samba-technical@lfdr.de>; Fri, 30 Oct 2020 09:52:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=K51NOunxlqNX6DT8sv+f+ghf/FSdlXtulOEnPj2rmlU=; b=nwFvdK6CCGnQ2FMfn1qtqnkyZU
	HpDPYpygFe+A83KIyBBmCXg/GXETWYsTYSN4Imo211ONcJc1xs6R3FA77viQOB23Ilzu7NHBanVp/
	KuN0WUrFR4H3CdXbfXQpFy3E7x4+Cjz4B4vi7kS4kFgB7/mtm7YQjlFoz+zb6BbsoriRo+2Y1wEvq
	pswsxHQNaWxwiSf9Si7VTrhaXg34tP7DwE+JZPeuHpbvN88pl33vfwW4he0kXoOp4mQlT/Ikrdwvh
	BKPvVG9VYEEvipkwAoXcETS7vOS9VgDM3ttS/HLfROGshQ/pWPWgBYq3kSDQr38cdiSLs1TTo18oV
	W5gaWVUA==;
Received: from ip6-localhost ([::1]:61278 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kYQ9D-00EcZ1-PI; Fri, 30 Oct 2020 08:52:35 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:54944) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kYQ99-00EcYu-7e
 for samba-technical@lists.samba.org; Fri, 30 Oct 2020 08:52:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:Cc:To;
 bh=K51NOunxlqNX6DT8sv+f+ghf/FSdlXtulOEnPj2rmlU=; b=GshhynSCRqKxZUahFtRlcl3lhX
 i3y2/pdEGqB6i0WRryMBVZiLweNInafVyb/6AsinQhahm13hVJ/S1FkofE9jBc0/976FxjIzCDyfe
 fhyAZgJZu9KvvgZgZ1UoLQBgz0rEOOi+rdWx0f1j/TZF7jxrC0SM7zSkOUG7tbzYtrLFmmqBIqeyT
 vXnpe/eyMj6Sp4XQKrFHp9/IAAz8PJCEn14yYwk+CjGV4kzC57DoYx/YHMY7Hqc/64gbPWu6/Ugul
 BpDA/uOOPIko9SdwkamjBlX/EmKESS8EFj2eUJUn8iM/Q7VlgTvU56SSn55P8cpIXPzDiqkLJt8YQ
 JJhciRUKIsWLBp9BiG8Z7LTbb9lQj+LDXvzUlR+DYC2sXgvZcM2vOTPN8rTOvZiqiwf6DIezA8Tem
 TrYynepSn3C9NT9Zpt+6dS7iaQCFuKXVENhA7aUNtNfRIFg8f/etyEUGHQoPw60VidpJbiD+7axDJ
 Ffu5lrNgh6PBevdnnjCrOUEL;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kYQ98-0008QH-7r; Fri, 30 Oct 2020 08:52:30 +0000
Subject: Re: can't start smbd after install samba posix branch
To: ronnie sahlberg <ronniesahlberg@gmail.com>
References: <20262379.55437477.1603985286601.JavaMail.zimbra@redhat.com>
 <1397349053.55438877.1603986203418.JavaMail.zimbra@redhat.com>
 <57860C29B41C41148C728C7F08BD12FC@rotterdam.bazuin.nl>
 <1282344879.55505050.1604024067212.JavaMail.zimbra@redhat.com>
 <CAN05THRxZ_=o0QnniT4-J365E34nUQxJube7mUQa17Lcj3YzuA@mail.gmail.com>
 <758246149.55514473.1604038831866.JavaMail.zimbra@redhat.com>
 <47e9f3cf-e258-f441-76d5-4e72b4073031@samba.org>
 <2038917775.55518004.1604044565533.JavaMail.zimbra@redhat.com>
 <db176606-3dbd-b0d8-e249-9ab6cd693ba3@samba.org>
 <CAN05THR21TwQdcLUTDoa6bt13Zx5k+huT7Gg8m3TeGjBwPLqdw@mail.gmail.com>
Message-ID: <fbc9e6a2-5934-c21b-cbc3-3d0dda0c4e32@samba.org>
Date: Fri, 30 Oct 2020 08:52:29 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <CAN05THR21TwQdcLUTDoa6bt13Zx5k+huT7Gg8m3TeGjBwPLqdw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
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
From: Rowland penny via samba-technical <samba-technical@lists.samba.org>
Reply-To: Rowland penny <rpenny@samba.org>
Cc: "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On 30/10/2020 08:45, ronnie sahlberg wrote:
>
>
> On Fri, Oct 30, 2020 at 6:29 PM Rowland penny via samba-technical 
> <samba-technical@lists.samba.org 
> <mailto:samba-technical@lists.samba.org>> wrote:
>
>     On 30/10/2020 07:56, Xiaoli Feng via samba-technical wrote:
>     > Hi,
>     >
>     > ----- Original Message -----
>     >> From: "Ralph Boehme via samba-technical"
>     <samba-technical@lists.samba.org
>     <mailto:samba-technical@lists.samba.org>>
>     >> To: "Xiaoli Feng" <xifeng@redhat.com
>     <mailto:xifeng@redhat.com>>, "ronnie sahlberg"
>     <ronniesahlberg@gmail.com <mailto:ronniesahlberg@gmail.com>>
>     >> Cc: samba-technical@lists.samba.org
>     <mailto:samba-technical@lists.samba.org>, belle@samba.org
>     <mailto:belle@samba.org>
>     >> Sent: Friday, October 30, 2020 2:30:16 PM
>     >> Subject: Re: can't start smbd after install samba posix branch
>     >>
>     >> Am 10/30/20 um 7:20 AM schrieb Xiaoli Feng via samba-technical:
>     >>> There isn't error log output. Just know the exit code is 1.
>     >>>
>     >>> # smbd -D -d 10
>     >> try
>     >>
>     >> # smbd -iF -d 10
>     > Thanks. Now from log, I know the config file patch is changed to
>     /usr/etc/samba/smb.conf.
>     > Create it. Then smbd can start. But mount option posix is still
>     unsupported.
>     >
>     > # mount //localhost/cifs ~/cifs -o
>     user=root,password=redhat,posix,vers=3.1.1
>     > mount error(95): Operation not supported
>     >
>     > [81490.590281] CIFS VFS: Server does not support mounting with
>     posix SMB3.11 extensions.
>     >
>     > smb.conf:
>     > [global]
>     > server max protocol = SMB3_11
>     > unix extensions = yes
>     > [cifs]
>     > path=/mnt/cifs
>     > writeable=yes
>
>     There is a reason why it doesn't work, you appear to be using one of
>     Jeremy's git branches where he is working on SMBv3 Unix
>     extensions. The
>     operative word is 'working', they do not work yet, so I wouldn't
>     use the
>     branch unless I wanted to test where he had got to 😁
>
>     I suggest you wait until the required patches are finished and
>     have been
>     accepted into Samba master.
>
>     Rowland
>
>
> Not true.
>
> Me as well as Steve and the other cifs.ko kernel developers have used 
> this branch for quite a while.
> We even have a cifs.ko buildbot we use to test this very branch.
>
> ronnie s
>
Sorry, but I treat anything outside of master as experimental and only 
to be used for testing, you might use it, but would you use it in 
production ?

Rowland



