Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B9F3DFC723
	for <lists+samba-technical@lfdr.de>; Thu, 14 Nov 2019 14:15:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=qftnhyeLr2Wsw8y1oh+hTf/gesPw1r1Gc3jGuYvBMVA=; b=RHA932evxL40rxzZAWC0frM5FZ
	KjkbyN2+lnJIOaVYNsCNQn3WPexEz4Px/QwePCKPFNv07fC8Byql4QQylphJDeHu0R9cZJgQoep4Q
	ojKVSSBYIQqEhNjcKlcnnb5348ykxB0I+56hQi7/0W+yfoiXV6SFfrY5sdizunT/3y0VDgYwpaXMr
	oNwEPac77h/I2ob0Zze1oHBuGzbu1RPQtxcRFMXg8Lns72kTSkewUGL2yEEFPZi+4QyQX59o/5pWZ
	OrKzcKohhgPkEIzuJlq7PEioFEkb4s9CjlUGy/GCc1NWR+u601ceI3Tc3PoumW2w5Uu57pQ6oydr8
	NAKaehzg==;
Received: from localhost ([::1]:39910 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iVEy1-000XHV-6T; Thu, 14 Nov 2019 13:15:21 +0000
Received: from [185.16.48.59] (port=47258 helo=smtp.tranquil.it) 
 by hr1.samba.org with esmtp (Exim) id 1iVExt-000XH4-9A
 for samba-technical@lists.samba.org; Thu, 14 Nov 2019 13:15:16 +0000
Received: from mail.tranquil.it (mail.tranquil.it [185.16.48.58])
 by smtp.tranquil.it (Postfix) with ESMTPS id 9EE0A40643;
 Thu, 14 Nov 2019 14:15:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tranquil.it; s=mail;
 t=1573737310; bh=qftnhyeLr2Wsw8y1oh+hTf/gesPw1r1Gc3jGuYvBMVA=;
 h=Subject:To:References:From:Date:In-Reply-To;
 b=S2XoOKbm7KE0vDKHf8oyydoObxc8C5nsLKSnyQKTxW8ArAXb0m6JTX9J3zLH0dpY/
 LcKb2XCFItbDjV/OwtrFqyM8FMOIEhwPBD15xvAcku6CvxYW/nC5NdTSbKK+LK84ni
 Yyoc4BTpZhxZRdh//4E0Uk37mZXAtCsvotzoE1PM=
Received: from localhost (localhost [127.0.0.1])
 by mail.tranquil.it (Postfix) with ESMTP id 7313170;
 Thu, 14 Nov 2019 14:15:28 +0100 (CET)
Received: from mail.tranquil.it ([127.0.0.1])
 by localhost (mail.tranquil.it [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id XjUuOXUKaQCv; Thu, 14 Nov 2019 14:15:27 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by mail.tranquil.it (Postfix) with ESMTP id B0C747F;
 Thu, 14 Nov 2019 14:15:27 +0100 (CET)
Received: from mail.tranquil.it ([127.0.0.1])
 by localhost (mail.tranquil.it [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id dCf-vUwp5N_w; Thu, 14 Nov 2019 14:15:27 +0100 (CET)
Received: from srvlts1.ad.tranquil.it (bureau-sdsl.tranquil.it [185.16.50.4])
 by mail.tranquil.it (Postfix) with ESMTPSA id 93D4A70;
 Thu, 14 Nov 2019 14:15:27 +0100 (CET)
Subject: Re: feedback on ldap improvement in samba 4.11
To: Gary Lockyer <gary@catalyst.net.nz>, samba-technical@lists.samba.org
References: <4ac9eeeb-211b-ca35-d234-6648c612ce3d@tranquil.it>
 <36c80274-fefe-e1ff-c6ee-223f85195c22@catalyst.net.nz>
Message-ID: <8cf68d63-9006-49d1-cfe2-0bc42cd89a58@tranquil.it>
Date: Thu, 14 Nov 2019 14:15:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <36c80274-fefe-e1ff-c6ee-223f85195c22@catalyst.net.nz>
Content-Type: text/plain; charset=utf-8; format=flowed
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
From: Denis Cardon via samba-technical <samba-technical@lists.samba.org>
Reply-To: Denis Cardon <dcardon@tranquil.it>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi Gary,

Le 11/13/2019 =C3=A0 08:40 PM, Gary Lockyer via samba-technical a =C3=A9c=
rit :
> That's by design, as I get confused by processes that restart after a
> SIGKILL.

I'm speaking about the ldap worker processes, not about the master ldap=20
process. Perhaps I'm confused, but if oomkiller kicks in and SIGKILL a=20
worker, I would have thought that it would be nice for a new worker to=20
be re-spawned.

Cheers,

Denis

>
> On 13/11/19 23:24, Denis Cardon via samba-technical wrote:
>> About the prefork model, the master ldap process is properly restartin=
g
>> the child process after a SIGTERM but it is not restarting after a
>> SIGKILL. Is it normal?
>
> Ng=C4=81 mihi
> Gary
>

--=20
Denis Cardon
Tranquil IT
12 avenue Jules Verne (Bat. A)
44230 Saint S=C3=A9bastien sur Loire (FRANCE)
tel : +33 (0) 240 975 755
http://www.tranquil.it

Tranquil IT recrute! https://www.tranquil.it/nous-rejoindre/
Samba install wiki for Frenchies : https://dev.tranquil.it
WAPT, software deployment made easy : https://wapt.fr

