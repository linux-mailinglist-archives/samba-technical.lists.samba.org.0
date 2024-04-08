Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id AF83E89C950
	for <lists+samba-technical@lfdr.de>; Mon,  8 Apr 2024 18:04:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=cRhyE5ExsR4NmWaKnY7KN3gy7GF+WJtxJ6MaLRDMWGg=; b=AYYQ1OaN6RX7KFbSwf/nmfgERN
	P2FRVhnRVpT0VwSONIgKbfCwtAgWxmbOZASIFCEtI5VALAy36/W2g+VUbSxKuELIP8PNmPSi5B6iB
	pDKcqN3c5qcqzcGKRMzqE2BY11SFIMqCb6ZQfvLEMTpn5hbix/es1+xf0mNd1hL+r59PJIpdKSK88
	vJ6qH+0irTq49T8C+11QxS21TZxBHjo1SgsHCOx6jBq4Q2Hhj005Qt1ClzJ/+S8lIu4XhC4FbRUOz
	9R8ijnTwriYUDCDT61Rw/MTcu7z2X6mx2dUtJc0pO8XjSjiHDwuggnWPl55m4UXRSJJHv6Ol0h+Vn
	vlG0AW7g==;
Received: from ip6-localhost ([::1]:32442 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1rtrTD-004KgP-F1; Mon, 08 Apr 2024 16:03:43 +0000
Received: from mout.gmx.net ([212.227.17.20]:39895) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rtrT8-004KgI-NQ
 for samba-technical@lists.samba.org; Mon, 08 Apr 2024 16:03:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
 s=s31663417; t=1712592215; x=1713197015; i=felix.b.mueller@gmx.net;
 bh=vkpjWeW44xgvatOBuBfhOF0K+gRX5fqpfbtZfap00FU=;
 h=X-UI-Sender-Class:From:To:Subject:Date;
 b=aJ57PRZcQLsKFr6BjlmJ8OcAb559QFDvwahvTUhjF5MeUG9iXVOhdqaIllHduoWo
 fWVULIw6YWHF0V4+GJFJDg1SQRMJ7L8XW/i/AdbXvRPtzyCoHpAL7CeFLsreY6x4u
 dSTpT2w4Se+3CGCnFh5eBa48lMNpVd/6MDrYx03xvu+ggS3Uh4t7Yl8OomnsGRZo6
 iHNkWgBko591jbrhOOtp0wbOz02t7fxEd6CUxrzfigaVps+Ed1z0i+w3tp1bbxyQq
 nN+ClUznvMASqHwQaZJt48EUIF5RDBATp0HdzPpVbWdEiJ1g8SVyB8XXpq7DxX1P0
 31oiTCFhcWsXBsM5lA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from desktop1 ([217.248.51.14]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MPogF-1s7wCi1guZ-00MqFM for
 <samba-technical@lists.samba.org>; Mon, 08 Apr 2024 18:03:35 +0200
To: <samba-technical@lists.samba.org>
Subject: DynDNS Update - IPv6 Problem
Date: Mon, 8 Apr 2024 18:03:35 +0200
Message-ID: <001901da89ce$4fb4fae0$ef1ef0a0$@gmx.net>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AdqJxm6vTedDAKJBShi0cKR0Iuw1Hw==
Content-Language: de
X-Provags-ID: V03:K1:Sa0OMQUsMoNujBDI9sedbrxWwY7r1QtLKknG4RTMruoMzXuG4In
 HnxB1ZI+T8xkt8GZ/xKu1ahFR5jkRA6pNhfu4ZIcwzXptxs2j/8F9xaUej9Mcegh9luo4Bi
 94JQ1bDAJAqr29495joaTODSpgVc7tIhZEUd33C+NDN4ndtqQBQCOUVoZHz+IKi41ZuoY3w
 FkYFgCaROsj4yj7RWVSQg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:kuW03PlxTiQ=;+QeFsUPWYkDsu4lO3WTiOBmNlpR
 6LWWMjZs+UDh+KGYiXFzr5wMdNfrKI0SodZMjcPjTYEy1+SQZ+IaEAl5W8t+RGNkLlLJi8Of3
 4SccXcPBRE4G3n8rKgV4ybSItnz8tFmkHdqU1qtCz6iSX0a7wXv7CaAP8MtxXDAGQcou+NvGL
 ZnqDxkhkqviJqGU3HhRCguOELFnxuVSMGsx4TP4cYGjgCpBMiXo3Zrc9JQgjdWxRKiVqDccMl
 LQGOuqiEaDd8JRV2CO2m5HSJzmxQWug40xdTaxtb178d8HZ+qeGIDr0v9ToTLam1NB6Z2F2EQ
 CSKDYVJK00/E0H7lr1VMWJ0zW1OISZcgv2b1j6Ct/Me/Tw34VhBbfQlwLaW2MGRLTPJNdPtpf
 HgNIJs0NDjNrKbcwgYu2DPqdCurCdvyysHEfVINGI29rU9eBR2RgeRaiewajvHLQ1Wd7aK7yh
 qTmAQ22vqf20p9ZkA7s2UG+A+wG3ToaEPvmaOEmvGMWJo4sLGK+n5a21AFSaE5kJBv8N6EaoY
 3czqlvwdTjDJ/xP7ecmZN3Zi0nvSZw5MrzpV6SwaBwCstN/nP6WYLA1qIZFsaPs0pLnD7U1/t
 kxxe1XQlr0qymq9n69ZtR6o6cqal1ywGsV4alyAnO/aJR0vp2DFXb98wqzo8JrNkuTQeMpdwB
 PTh5MdHb66PWShT6sbrLtWacpCz9kkTycMYkyT6PZyxVw/9vIUaQDftIHhDjK4Xs/XC1oRqKb
 bYK3pimI7dEpRwzACo7bEKQOl6hapao7RwtAflndu5oSEw57K+Bp034NduFiif35UBzQFhpic
 ZjoiFAAwtWOnmCWEDJRP/29b8Y0Mp71zzs1ZTyHgsBVEQ=
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
X-Content-Filtered-By: Mailman/MimeDel 2.1.29
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
From: Felix Mueller via samba-technical <samba-technical@lists.samba.org>
Reply-To: felix.b.mueller@gmx.net
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Dear Samba team,

=20

I have a little remark regarding the script dhcp-dyndns.sh which is
published here:
https://wiki.samba.org/index.php/Configure_DHCP_to_update_DNS_records=20

=20

Having at least one IPv6 Reverse zone, case 4 (# should never happen) in
rev_zone_info() will be selected. Hence, the PRT record will not be =
updated.
My =91solution=92 is sort out the IPv6 reverse zones by Changing the =
line below
=93# get existing reverse zones (if any)=94

=20

ReverseZones_unfiltered=3D$($SAMBATOOL dns zonelist "${Server}" "$KTYPE"
--reverse | grep 'pszZoneName' | awk '{print $NF}')

ReverseZones=3D

for revzone in $ReverseZones_unfiltered

do

# Check if the string contains "ip6"

if [[ $revzone !=3D *ip6* ]]; then

     # Append the string to the filtered list variable

     ReverseZones+=3D"$revzone"$'\n'

fi

done

=20

Is there a better solution or way how to handle IPv6 and updating the =
DNS?

=20

=20

=20

Best regards!

Felix M=FCller

=20

