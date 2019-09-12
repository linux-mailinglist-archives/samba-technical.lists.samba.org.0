Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id CE911B1218
	for <lists+samba-technical@lfdr.de>; Thu, 12 Sep 2019 17:27:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=A9sDTZScr7ymIdYWp4n5+SCOgJlgp/dMU6/mhM3rxDY=; b=Yawma9292SYiAUYbP9Zzk3p/qQ
	cWCPcW8rJWVNP6xjtiMyAwAFVMb2THoW0ZvQpPEHLKJLziofiauBbNw7lbjZudNZq4H+lTe7/mcmi
	snuZQBMzgliCJzBqJxkglIqj9T77NsTvuHAHwXTXhFtKhEi9G9EeL0MN9COC1JKnvD3JwIdVKAY3u
	knpYBh4Ic86HVWTJyaqia7K4Yf9DIDo+Ho7eW7HFWiGogDBzoFIofiF6MalKmjnSope3ruv6Hkl8Q
	dPMF8vrIk7esT11UOUpv5RLYZ1LFkWgJ03vsmwFnWTVTaz0AVuKLNNk7rUPK6PVs9Ldn1+4DLZqcS
	Ix5OvgvA==;
Received: from localhost ([::1]:18516 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1i8Qze-00529i-8x; Thu, 12 Sep 2019 15:26:46 +0000
Received: from mail.sernet.de ([2a0a:a3c0:0:25::217:2]:55217) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1i8QzZ-00529b-A6
 for samba-technical@lists.samba.org; Thu, 12 Sep 2019 15:26:43 +0000
Received: from intern.SerNet.DE by mail.SerNet.DE with esmtps (Exim 4.92 #3)
 id 1i8QzY-0000cs-Ls; Thu, 12 Sep 2019 17:26:40 +0200
Received: by intern.sernet.de
 id 1i8QzY-0001Vb-IR; Thu, 12 Sep 2019 17:26:40 +0200
To: Franz Sirl <Franz.Sirl-kernel@lauterbach.com>,
 samba-technical@lists.samba.org
References: <20190911065708.GA7868@carrie2>
 <8eb21452-8d69-d9b6-1467-d663bc71cf6a@lauterbach.com>
Openpgp: preference=signencrypt
Organization: SerNet GmbH
Subject: Re: [Announce] Samba 4.11.0rc4 Available for Download
Message-ID: <74e57095-a057-e25c-97c1-c0b1642f4e4b@sernet.de>
Date: Thu, 12 Sep 2019 17:25:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <8eb21452-8d69-d9b6-1467-d663bc71cf6a@lauterbach.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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
Reply-To: =?UTF-8?Q?Bj=c3=b6rn_Baumbach?= <bb@sernet.de>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi Franz!

On 9/11/19 3:15 PM, Franz Sirl via samba-technical wrote:
> just noting that 4.11 will already be the third major release without a
> fix for the https://bugzilla.samba.org/show_bug.cgi?id=13745 regression.
> 
> Can someone at least comment on the bug so I can work on a patch and
> make PDF printing shares (via smbprngenpdf) functional again? Just
> moving the new %j/%J to %k/%K would be enough to fix the bug.

Thank you for the reminder.

Not only %j and %J are affected. There is also %p, which is used twice.

I've requested some comments from the samba team regarding the issue.
Metze added some notes to the bug report. There is still no decision,
but there are currently two ideas:

- make sure that the printing related commands are processed by
  standard substitution *after* the printing related substitution.
- add new substitutions and throw a warning if %j %J or %p is used

<comment>
Stefan Metzmacher 2019-09-12 12:56:51 UTC

Another possible way would be to mark the printing related commands as
constant="1" in their documentation that should avoid the lp_string() is
called for them.

Then we can do the printing related %j substitution first and then
call lp_string() as a 2nd step.

Yet another or additional way would be to replace it with something that
doesn't require a single charater, similar to %$(envvar).
Maybe %{jobid} %{jobname} %{clientip_pathsafe} %{serverip_pathsafe}
%{printername}...
</comment>

Maybe we need both here.

Best regards,
Björn

-- 
SerNet GmbH, Bahnhofsallee 1b, 37081 Göttingen
phone: 0551-370000-0, mailto:kontakt@sernet.de
Gesch.F.: Dr. Johannes Loxen und Reinhild Jung
AG Göttingen: HR-B 2816 - http://www.sernet.de

Besuchen Sie uns vom 08.-10.10.2019 auf der it-sa
IT-Security Messe in Nürnberg, Halle 9, Stand 204
Tickets: http://it-sa.de/gutschein, Code: B411535

Meet us at IT security fair it-sa in Nuremberg
October 08th -10th 2019 in hall 9 at booth 204
tickets: http://it-sa.de/voucher, code:B411535

