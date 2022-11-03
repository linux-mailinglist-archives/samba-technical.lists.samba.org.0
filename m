Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id A1EAE6184C4
	for <lists+samba-technical@lfdr.de>; Thu,  3 Nov 2022 17:35:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=LQj7lvSuW9yj3Xyq/Tec46csBIUdXhQS46WcT+wcq+s=; b=NvApJvoGYSqYju4TnoA4MHlXXf
	2NiHhC/MppCCHr++Zy8+UWI6vGYE6O+p0mFFTb5w2WAfcs04dLbfnMJ6AOAYBeIVb3vSLLvkwLyBq
	dm6Lal3KuEFdCuraX/ZGMtYt/S7DmzRwMg1IuzUzA1Eu24pv6bjgjpf1EEQr2K/KB7Jh7YEcKrQ+E
	xvxXvdvnAOquaUvNEqlX9czcvBjb0ixsjupCUlBIucDJXFuPVUzhbOEF93Fqv1GgPBg0cA+9gpnL3
	ahQAS3jOCBkpy4tH4ASEDCbHydWeMzaNYWvaW30Wly4FFrwXD2OrsVtBsKupqXQTFgV13/J7wXG6K
	EZ3OSlGA==;
Received: from ip6-localhost ([::1]:56166 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1oqdAe-00ALJD-8T; Thu, 03 Nov 2022 16:34:24 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:29274) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1oqdAX-00ALJ3-Cj
 for samba-technical@lists.samba.org; Thu, 03 Nov 2022 16:34:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=LQj7lvSuW9yj3Xyq/Tec46csBIUdXhQS46WcT+wcq+s=; b=FD/fZGO3T3zvu5UtpLw6ciFf6V
 6YeZmLCV+SrLTJhuhbPj40ui66iG0rYtH6i+vxjG8sQaxMTJ9VFAUVSuXHFNXMXYKhWw1vgMRYOHS
 /WYrl5mVZ8plhOIdYULo5Dhu9IF+MLK6j8lT8xxw/5pJbje+WWMzSjqPf9Tq6eGI0AW0QL1gfetqT
 62/kQZ/SyFFv3JXPSI0/apC7QNc8+tRaqRCdvQAMLUrH56J6/XP+Hl4CtxtNolPSBUmNwj7W2oNpr
 FYFwtDbIpVcGQZuuR6MuppWUOLymjJX2yOS8tNrxUWopH1EmN8TorYjquir751hb59lUyNIAOS+QF
 1fFvG6svi5azV8lQqmhP1vEeXpRzkdnexIWm7ffr0PjrtQXY7B29OYfpkQIlr0eWsFy/je20BGwQx
 2WL8BUXGJmVIOAvXFxfvamNTGNiULlXb+PBwjm/GbVJ/SqEX1gjH7puGC0sERfn8bqSqBhF1xo7UM
 5+CJjADQBCl0tGshs+OKo753;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1oqdAN-0074eG-Nx; Thu, 03 Nov 2022 16:34:08 +0000
Date: Thu, 3 Nov 2022 09:34:05 -0700
To: Andreas Schneider <asn@samba.org>
Subject: Re: [SCM] Samba Shared Repository - smbclient rate limit
Message-ID: <Y2Ptfaho/UO1QUTD@jeremy-acer>
References: <E1oqMWf-005wfA-O3@hrx0.samba.org> <12090652.O9o76ZdvQC@magrathea>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <12090652.O9o76ZdvQC@magrathea>
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
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Thu, Nov 03, 2022 at 08:11:01AM +0100, Andreas Schneider wrote:
>%s\n",
>> @@ -902,6 +968,13 @@ int main(int argc, char **argv)
>>  			.val        =3D 'f',
>>  			.descrip    =3D "Use specified rc file"
>>  		},
>> +		{
>> +			.longName   =3D "limit-rate",
>> +			.argInfo    =3D POPT_ARG_INT,
>> +			.arg        =3D &opt.limit_rate,
>> +			.val        =3D 'l',
>
>This should use an enum OPT_LIMIT_RATE instead of 'l' or it will confilict
>with common options!

Well you did RB+ it already and that code hasn't changed
=66rom the code you reviewed :-). The 'l' here is the value
returned from the poptGetNextOpt(), not a shortName.

If it's incorrect can you send a follow-up MR and I'll
review. Thanks !

Jeremy.

