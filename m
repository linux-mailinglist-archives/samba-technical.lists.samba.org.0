Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A29E10A4D7
	for <lists+samba-technical@lfdr.de>; Tue, 26 Nov 2019 20:55:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=uIZJ08L4FJZQsdikjeipVmwSEPvPCJ6OyYAquERQyik=; b=vKIAtuaPFCKUZonikztXOTbXUP
	KOMETY0w5TkDtnOdYqBBHvwboyJKo2A0QDbZ6s/8n678cMDpnZ117sqJlPIxfJKQrbF0tGOjHoiEf
	KSppH80gOVfekZjg0aWGDGi6g560P/HOkhbKbmzHAIvIUpU+2F5uocaon2wN0PJRkdZS8b5yhJsev
	H01q6w9XadiHI5fyT/slRhOqyUGJbpeKqf1iDz05AoVaQCMaCm2qax4J6eq2BIF9FLiAYJrWzHWjp
	Q0RBvc87kq/lByUDBYHPJ+8jG3qVyFWJx3Yuc4Sk/Q0qti51EU49GQCaFcH6S3/Etf+pUwJPTkYmD
	3s98pcHQ==;
Received: from localhost ([::1]:40514 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iZgvm-002XRY-F3; Tue, 26 Nov 2019 19:55:26 +0000
Received: from mail-lf1-x144.google.com ([2a00:1450:4864:20::144]:43360) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iZgvf-002XRR-3l
 for samba-technical@lists.samba.org; Tue, 26 Nov 2019 19:55:24 +0000
Received: by mail-lf1-x144.google.com with SMTP id l14so15108487lfh.10
 for <samba-technical@lists.samba.org>; Tue, 26 Nov 2019 11:55:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=vVMzl3Eas3y6VWP81J2YIFDNi8foCocJjnLs1aNjs7M=;
 b=hmlTxkGYhQn6ZslIktRCKvLgDBBpR1vDTMw17ZAdeBAth00/qTG2QbqfJobubS7ikl
 RaQpWcKP7YpcFjv7vLGsw1FHE0Y+xN7v8m92ZzZMyEOP5Kwn22sbK3YmDmS5iz0kxuSb
 4gG+IF+Z6wtPcd+NQTGawW5RW6Y0RLk2NgDzLT8Zstvz8Z0vgOtFij+exlR142HzLAby
 ozc4XzqSIhGn9OY1WldwT6UD8VvrJNtX/lBrY9MiVUl7gWieH4BC/GUKZls3Li4doaq2
 cMu8moRxmFEsIt0CBjb2RNgVrulS2sdU5OqRW3qz9O90069wujeeUN6pUCH1K+i+7srd
 aWgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=vVMzl3Eas3y6VWP81J2YIFDNi8foCocJjnLs1aNjs7M=;
 b=KM4/rnhyZPKBCuy0/6092iEBDbgIpE5XkGNIMikCNR5YNLg98k4s61cKvXz4vbG0TD
 bVYzI6TTmrqo+a6hZ+osvlmWOBzFBIrrJ8/Ij+4uQpl4rkES1muvpSX6dt0EU2ju3GOU
 nPPHUffdsuRbfEb8TFPG8DsJN1M5Yq2keAUWPID+pkEow3P9ApvjJ6f6RpCO9gAv+M+Y
 BAbHveXqJv7Cp0crOsJ5QH7sJfzHgeWGLbf/p5J2h4x9xwtyj6tM54xNpSSU55nTZfam
 h4w/WxQpRDg4mH3nMW0FAvZvVIBiBa3Q65OJltjgQBbYTnUyrpdT6PsT8F9tYgToqvt4
 WrIA==
X-Gm-Message-State: APjAAAVVgiwJBE7wh8QgoqW+31OjCLWX8OvZddEniyXBwi2zZr9paMl6
 JNkw6S2tbKG5dNqTrIYZMqFiGjfgG6cMVBEBukaYfpP2i78=
X-Google-Smtp-Source: APXvYqwR7fsj851TjwZxkYR52b4x3jUJ67PZ5VxDt49CW7yAg7LQfA1Jm44muPLVjCFTfQuuttarkTPvnDGko0WPVJI=
X-Received: by 2002:ac2:47ec:: with SMTP id b12mr20651483lfp.162.1574798117421; 
 Tue, 26 Nov 2019 11:55:17 -0800 (PST)
MIME-Version: 1.0
References: <CAPw4iV5nHkd8E=9PfbYepaStPRoqWJX+iZRVicgrRf2vcHK3uQ@mail.gmail.com>
In-Reply-To: <CAPw4iV5nHkd8E=9PfbYepaStPRoqWJX+iZRVicgrRf2vcHK3uQ@mail.gmail.com>
Date: Tue, 26 Nov 2019 14:55:05 -0500
Message-ID: <CAPw4iV6qTv5ssFZEFUN0zuVuZ38ofXq_x+QSTUHT8QFrBtmRhw@mail.gmail.com>
Subject: Re: Why is smbd looking for Kerberos principal cifs/host@DOMB when it
 is a member of DOMA?
To: samba-technical@lists.samba.org
Content-Type: text/plain; charset="UTF-8"
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
From: "Nathaniel W. Turner via samba-technical"
 <samba-technical@lists.samba.org>
Reply-To: "Nathaniel W. Turner" <nathanielwyliet@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Perhaps someone on samba-technical can answer a slightly different question
about this: Since I know that this configuration can successfully
authenticate users in both domains when NTLMSSP is used, it would be nice
if it could fall back to ntlmssp after gse_krb5 fails to find a keytab
entry for the (seemingly bogus) principal name. Is that possible given the
protocol constraints?

This seems similar in some respects to
https://bugzilla.samba.org/show_bug.cgi?id=3D14106, though that case is
different, as my server *is* an AD domain member, and in that issue, the
server is *not* a domain member, and is starting out with GENSEC mechanism
spnego from the beginning, and just choking on a client token that doesn't
make sense in that context (if I understand it correctly).

If it's not possible for the server to fall back to ntlmssp after going
partway down the gse_krb5 path, would be be reasonable to somehow
disable krb5 for client authentication (while still using it for
communication with the domain controllers, of course)? As a practical
matter, Windows domain member clients seem to work fine when samba just
uses ntlmssp (which it seems you can force by using an IP address instead
of a hostname in the UNC path when connecting), but maybe there are
scenarios where that's not the case.

n

On Fri, Nov 15, 2019 at 12:23 PM Nathaniel W. Turner <
nathanielwyliet@gmail.com> wrote:

> Hi all. I=E2=80=99m trying to understand a weird authentication failure:
>
> I have two domains (TC83.LOCAL and TC84.LOCAL), each in a diferent forest=
,
> with a bidirectional forest trust.
> The samba server kvm7246-vm022.maas.local is a domain member of TC83 and
> is running a recent build from git master (f38077ea5ee).
>
> When I test authentication of users in each domain by running ntlm_auth o=
n
> the samba server, it is successful for users in either domain.
>
> When I try to connect from a Windows client in TC84 using SMB, it is only
> successful for users in the TC83 domain. For users in the TC84 domain, sm=
bd
> seems to go off the rails looking for a Kerberos machine principal in the
> TC84 domain, even though it is not a member of that domain (it's a member
> of TC83, which trusts TC84):
>
> Nov 15 15:53:04 kvm7246-vm022 smbd[15209]: [2019/11/15 15:53:04.524996,
>  1, pid=3D15209, effective(0, 0), real(0, 0)]
> ../../source3/librpc/crypto/gse.c:659(gse_get_server_auth_token)
> Nov 15 15:53:04 kvm7246-vm022 smbd[15209]:   gss_accept_sec_context faile=
d
> with [ Miscellaneous failure (see text): Failed to find
> cifs/kvm7246-vm022.maas.local@TC84.LOCAL(kvno 10) in keytab
> MEMORY:cifs_srv_keytab (aes256-cts-hmac-sha1-96)]
>
> Why is smbd looking for a principal of the form
> "cifs/kvm7246-vm022.maas.local@TC84.LOCAL"?
>
> n
>
> [See
> https://drive.google.com/drive/folders/1jsVWHL--mVEnK9pDFUajyt2nQQ5cLpOQ =
for
> full logs and smb.conf]
>
>
