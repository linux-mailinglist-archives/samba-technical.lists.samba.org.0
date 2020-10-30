Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B8AA29FFF2
	for <lists+samba-technical@lfdr.de>; Fri, 30 Oct 2020 09:29:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=70hKkRHISpsOVkWD3j3kGBy8pphjJOQfzPgVsVaJIaA=; b=DzdYKlvQh6pPBQso8KiUlWwN1y
	+OuT5xT9ci4snsbxpm7aZdgDPV3Nv7s8SHY9wsSVVy7OBr7I/fgqfvk6zafnHi6Aw1fcqTWeelBha
	ycSmxTq8Pi4+AbXccaSRufPu2jbvjy8Heav9/AQM+gkNefSiVmUQ9uhoAyEu1VOgDITddqv5VjkCS
	N4WZNIWuTilof7+miywxvWLCED3GTvUYtInSHBHHokuvPMioznIjXpsugGWS5H351fwJG9cmgJvLC
	oME1jqqkG6AOp4jVZkVoKoga1S17IsPwEReDoLDQ6h9S+D9QZrtVs6AFFfanQYMXAazhFUnqu/LFx
	Hw00tfng==;
Received: from ip6-localhost ([::1]:57582 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kYPlq-00Ebyn-H0; Fri, 30 Oct 2020 08:28:26 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:47996) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kYPll-00Ebyg-6i
 for samba-technical@lists.samba.org; Fri, 30 Oct 2020 08:28:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:To:CC;
 bh=70hKkRHISpsOVkWD3j3kGBy8pphjJOQfzPgVsVaJIaA=; b=Fx91RuCu/1rb4oUKCNmEKGqzlz
 YeKhqieZtUwKG8OdutD7FFRGTzxJIzmzg1LMiMV7rliYMeBrFeOrf0yDnN04udN849OTtc/Ip85Op
 IJue7VCaT8eoFem6J15vcJaTH2Ljw+QqE/HupywSU52TEl1hIQcdwOT/XtLEjNqOD0aOBUZBFtyw8
 Yu9lSce8F3Pg2imByDKrvpkF9rdyVxLFiVNds41GMQR+vrBuZGsZ4JOCz1TELfXzZq6f51pL3/sjj
 tLW/99iqnC9hh1PUkmWDZB0Yyo6d9ZwGtbGV5ETwA8FYl3UBLfzbBweRkhDZjdP3vh+A+J+nSsrZo
 bE1SfBebB7rywwZQqhhlsMmVEkMn0/VfxxvQeBykRkZb1AZroFygb4KqgR3Bol4/HJPp1KKqUnjMn
 sDWphPjEHnausK2e2vXTXPswLRAuftFKyIQGq/iMYwKyaaA98HCXYNEgIaOick+Rl9yDbDfSMnXCc
 qi0k2Gupv2ej9WPwRTez0wvF;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kYPlk-0008AL-Ki
 for samba-technical@lists.samba.org; Fri, 30 Oct 2020 08:28:20 +0000
Subject: Re: can't start smbd after install samba posix branch
To: samba-technical@lists.samba.org
References: <20262379.55437477.1603985286601.JavaMail.zimbra@redhat.com>
 <1397349053.55438877.1603986203418.JavaMail.zimbra@redhat.com>
 <57860C29B41C41148C728C7F08BD12FC@rotterdam.bazuin.nl>
 <1282344879.55505050.1604024067212.JavaMail.zimbra@redhat.com>
 <CAN05THRxZ_=o0QnniT4-J365E34nUQxJube7mUQa17Lcj3YzuA@mail.gmail.com>
 <758246149.55514473.1604038831866.JavaMail.zimbra@redhat.com>
 <47e9f3cf-e258-f441-76d5-4e72b4073031@samba.org>
 <2038917775.55518004.1604044565533.JavaMail.zimbra@redhat.com>
Message-ID: <db176606-3dbd-b0d8-e249-9ab6cd693ba3@samba.org>
Date: Fri, 30 Oct 2020 08:28:20 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <2038917775.55518004.1604044565533.JavaMail.zimbra@redhat.com>
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
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On 30/10/2020 07:56, Xiaoli Feng via samba-technical wrote:
> Hi,
>
> ----- Original Message -----
>> From: "Ralph Boehme via samba-technical" <samba-technical@lists.samba.org>
>> To: "Xiaoli Feng" <xifeng@redhat.com>, "ronnie sahlberg" <ronniesahlberg@gmail.com>
>> Cc: samba-technical@lists.samba.org, belle@samba.org
>> Sent: Friday, October 30, 2020 2:30:16 PM
>> Subject: Re: can't start smbd after install samba posix branch
>>
>> Am 10/30/20 um 7:20 AM schrieb Xiaoli Feng via samba-technical:
>>> There isn't error log output. Just know the exit code is 1.
>>>
>>> # smbd -D -d 10
>> try
>>
>> # smbd -iF -d 10
> Thanks. Now from log, I know the config file patch is changed to /usr/etc/samba/smb.conf.
> Create it. Then smbd can start. But mount option posix is still unsupported.
>
> # mount //localhost/cifs ~/cifs -o user=root,password=redhat,posix,vers=3.1.1
> mount error(95): Operation not supported
>
> [81490.590281] CIFS VFS: Server does not support mounting with posix SMB3.11 extensions.
>
> smb.conf:
> [global]
> server max protocol = SMB3_11
> unix extensions = yes
> [cifs]
> path=/mnt/cifs
> writeable=yes

There is a reason why it doesn't work, you appear to be using one of 
Jeremy's git branches where he is working on SMBv3 Unix extensions. The 
operative word is 'working', they do not work yet, so I wouldn't use the 
branch unless I wanted to test where he had got to 😁

I suggest you wait until the required patches are finished and have been 
accepted into Samba master.

Rowland



