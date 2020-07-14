Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 0491F21FD4B
	for <lists+samba-technical@lfdr.de>; Tue, 14 Jul 2020 21:26:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=58TVHpGVapcaUJBLFBL7+DDSvJqkZr5JSDuTFkWsNQk=; b=1Ggn0ov9DaoXYydCLBm4JOuILY
	4N9L4DFCBJH13LhkQy/UAtx7WG/RwaBvw2QOEfWxS4DEeypXIUTYmHxjyVMVGr88ceg91YPeDDgUD
	DU3p+zfTYkz/6zUK0V3wtKPE7Jaiija2VRL0Mm9jgXKjIUrtl8hP8jr3dVyHff5zblMTBX5wULa7L
	0/OcYRMrPzLLRkJGUdFMuYufpu+uZ6PO+SuR9yqPhY2TddJ1ZPf+WMbfV+7WB+s6rBAW5ezqGUYRs
	DosxXV8Om3ykm+TEIkdp9bB57EzS2RGmUb1CCUykJOH3PAyg49V0DHHHVp4bS4tCK9iyRcq4RJU0R
	fM1BK+Ig==;
Received: from localhost ([::1]:34396 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jvQZ5-007WdJ-DH; Tue, 14 Jul 2020 19:26:07 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:16484) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jvQYy-007WdC-AQ
 for samba-technical@lists.samba.org; Tue, 14 Jul 2020 19:26:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=58TVHpGVapcaUJBLFBL7+DDSvJqkZr5JSDuTFkWsNQk=; b=p51UQXpAgQ2sdJ5Ak6EH+vFGB0
 H4OW+S187pcTijbWbgJKDXN8fG32316cLIZtxjpyIx1eS8Oc1tbuJqBa96jkQe5QY5s4piqKATvpp
 /49Aq5ThEbzLwgHZcMdla1A2aVqlxtN4mItEnofxFfB9bAHVwnDbvaUWsDkMjYWUt/bbZCpvxi8EA
 PO5S6M77+ZNgmp8DlEB8Hj6DbqApSDWBSpNBBMuWa91jF/g1zqHE6pj8tf6dybXp/4Vpcsc6zU7+F
 O0nQ5kPnXT1HShtad28EoWLzpjmdZR/KiZnul6bjgtbwsl+slX4ZlEL8QQEpJxF+trXujNFI6uH6j
 D15YOolb08o4w2WiFPJ7NFhG8KMPa3I7N+AW4kSjf3jP+wFNAmQYkwbyHlYWDfjmG3afJF4MbR2qH
 kDXMm9EQLhIwvdTxb/290birhGsLPl+/Y6eDURC4szEkRECvjSwUltCt4EdSGHPwt5PhF0CkZL1v9
 6eVo6RbQ6s/0fqwZ70iYSOeg;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_AES_256_GCM_SHA384:256)
 (Exim) id 1jvQYx-0006M0-0c; Tue, 14 Jul 2020 19:25:59 +0000
Date: Tue, 14 Jul 2020 12:25:53 -0700
To: Krishna Harathi <krishna.harathi@storagecraft.com>
Subject: Re: Windows 2019 Server getting Invalid signature with Samba 4.7.11
Message-ID: <20200714192552.GA25797@samba.org>
References: <C16AF00C-262A-4A19-90B7-836DA392E620@storagecraft.com>
 <32C63F09-210A-4BCA-B603-1DFADDDC6F70@storagecraft.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <32C63F09-210A-4BCA-B603-1DFADDDC6F70@storagecraft.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
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
From: Christof Schmitt via samba-technical <samba-technical@lists.samba.org>
Reply-To: Christof Schmitt <cs@samba.org>
Cc: Vidhesh Ramesh via samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tue, Jul 14, 2020 at 06:26:36PM +0000, Krishna Harathi via samba-technic=
al wrote:
> I am continuing to investigate why a client is getting an =E2=80=9Cinvali=
d signature=E2=80=9D error.
>=20
> Sequence of events
>=20
>   *   Smbd generated a STATUS_NETWORK_SESSION_EXPIRED for a read request
>   *   Client requested for a session (re)setup of the current/existing se=
ction (shown below)
>   *   Smbd responded with STATUS_SUCCESS but response not signed (signatu=
re with zeros) (shown below)
>   *   Windows SMBClient noted the =E2=80=9Cinvalid signature=E2=80=9D eve=
nt (disruptive to client application)
>   *   Next, there was a new session setup request
>   *   Followed by smbd response with STATUS_SUCCESS with signature

=46rom a quick search, this could be
https://bugzilla.samba.org/show_bug.cgi?id=3D13661
Samba 4.9.3 and 4.8.7 have the patches for this bugzilla.

Christof

