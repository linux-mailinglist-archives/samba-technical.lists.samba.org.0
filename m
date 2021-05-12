Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 70A2437BA15
	for <lists+samba-technical@lfdr.de>; Wed, 12 May 2021 12:10:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=ADK5n0wwjbXMzX56x3JazQZVzpBKBWMrOO0D5HjddE0=; b=xJnNAOPP+Fe3qxio417by3CAro
	I+DPW8P0yPLYJkbj5WigG73nHDYlyr6hTQsiaVdxyFMfOVF7K3ilJMY7DZBLuaoY/gQ8kA1xtIzu+
	Oqo4FTDWDwggHSwLdrUqAazuoudsA46zZbvjBtBSDTXw4kgSyDXG6OST41+3PpomATotXZY8U2DeI
	j2/8IjKslEq7mIA0Uk4mlyFNYDGUeXIL/+9NqyONUOSUrt7wzljS0kMrheR+tbdUhjUdYpkdyeRmN
	mIXsn7hgBvD0lrtI07ZmbSpYV2Ns3H7TIIYumzakuU0M3YttipC8rwshnITDZpZ5MCDQXctvgK2uB
	HS8pP6sA==;
Received: from ip6-localhost ([::1]:50752 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lglof-00HD9C-5P; Wed, 12 May 2021 10:10:09 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:29262) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lgloZ-00HD93-RH
 for samba-technical@lists.samba.org; Wed, 12 May 2021 10:10:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:Cc:From:To;
 bh=ADK5n0wwjbXMzX56x3JazQZVzpBKBWMrOO0D5HjddE0=; b=ZY8mDSfWgXZ+3g5yuPvktlqcPh
 lC3V6Rf/NQWYPC/Lm06lFKbQDi92ClL1hurjNB4kKjwmCzv4yAAHMXF1SktInlF4SOAhompMJqzaS
 Sudn/CKzrsjDr1Url5KdbMlnERqAOwOkoHsh0X0lxJML/9ux90FUtPd/7USImwSzOzv9YW2nRcY0J
 Je8VMmoyYmKZanPdt0iT6W8Acti2dGqgmyYmx8XKOHRcifVnGx442KsgyU48YzRvkC8FVCSWNsAQz
 m8TjlVI5uDWNOTsRDcqkffkxCMX8eRifXJXJn78wKMCCllnBtKVZkiBnx+0755HhsD1bLdjg1P+GD
 V9U4VAL45pFz7tITAQ9VjNzihhMvlLn3a6KC8np0Zy0v9lG7K18jjWOWoNtlFcwqib6kivKVSJ7QC
 vIEEfV5Y+XQzbLjFdutB+vohsHVGM0SgtQQ1NjAiKRlbDMyoSFNsF7Ggo1KejAhJZh+2Q6UtlBGUl
 e8EVOHRYdWdrROzCDqijoPva;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lgloU-0007gx-KC; Wed, 12 May 2021 10:09:58 +0000
To: Gary Lockyer <gary@catalyst.net.nz>, Andrew Bartlett <abartlet@samba.org>
Subject: get_{local,remote}_address() in winbindd_dual_pam_auth()
Message-ID: <40406211-ddb0-39e9-eeca-6f4922269754@samba.org>
Date: Wed, 12 May 2021 12:09:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="xpv8TnpvEhYYsRNsH5owuUKPNImhXei27"
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
From: Stefan Metzmacher via samba-technical <samba-technical@lists.samba.org>
Reply-To: Stefan Metzmacher <metze@samba.org>
Cc: Samba Technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--xpv8TnpvEhYYsRNsH5owuUKPNImhXei27
Content-Type: multipart/mixed; boundary="ZUtTbJKCdMQoJV20bCzG2ynH2bHs4xZpG";
 protected-headers="v1"
From: Stefan Metzmacher <metze@samba.org>
To: Gary Lockyer <gary@catalyst.net.nz>, Andrew Bartlett <abartlet@samba.org>
Cc: Samba Technical <samba-technical@lists.samba.org>
Message-ID: <40406211-ddb0-39e9-eeca-6f4922269754@samba.org>
Subject: get_{local,remote}_address() in winbindd_dual_pam_auth()

--ZUtTbJKCdMQoJV20bCzG2ynH2bHs4xZpG
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi Gary,

in commit c8b7b7918b49f3598706190975a82be258aa9c44
Author:     Gary Lockyer <gary@catalyst.net.nz>
AuthorDate: Mon Jan 28 15:31:46 2019 +1300
Commit:     Andrew Bartlett <abartlet@samba.org>
CommitDate: Wed Feb 20 06:03:09 2019 +0100

    winbind: Log PAM and NTLM authentications.

    Generate JSON authentication messages for winbind PAM_AUTH and
    PAM_AUTH_CRAP requests.  The logon_id in these messages can be used t=
o
    link them to the SamLogon messages.

    Signed-off-by: Gary Lockyer <gary@catalyst.net.nz>
    Reviewed-by: Andrew Bartlett <abartlet@samba.org>

You added get_local_address(), get_remote_address(), which take a socket =
filedescriptor
in order to the addresses from the socket.

However all you pass in is the socket fd that's created in
fork_domain_child() via socketpair(AF_UNIX, SOCK_STREAM, 0, fdpair).

I'm wondering how this could ever be useful in any way?

Also in _winbind_SamLogon() your passing down
p->{local,remote}_address from pipes_struct, which were not used
before in winbindd and are both NULL.
It means that make_user_info() in winbindd_dual_auth_passdb() will always=

return NT_STATUS_NO_MEMORY. Luckily that code path is not triggered from =
auth_winbind.

Before we used tsocket_address_inet_from_strings(frame, "ip", "127.0.0.1"=
, 0)
only in winbindd_dual_auth_passdb().

You are also using the wrong pid for client_pid, it's state->pid instead
of state->request->pid, state->pid comes from fork_domain_child():
state.cli.pid =3D getpid(); and is the pid of the winbindd parent process=
=2E

Maybe winbindd's parent should check request->pid against SO_PEERCRED/SO_=
PEERID?
before using it for auth logging?

How did you tested this (beside making sure it compiles)?

What would be the correct way out of this?

metze


--ZUtTbJKCdMQoJV20bCzG2ynH2bHs4xZpG--

--xpv8TnpvEhYYsRNsH5owuUKPNImhXei27
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEfFbGo3YXpfgryIw9DbX1YShpvVYFAmCbqXEACgkQDbX1YShp
vVbZEA/8C5JpqcaPhi1JMk5qOYtqF2bwYD9ZSZdAmYyf19tU90z3uhjFmx4vTep8
WzLoVELiXiTjmdkboNEnfFkpgyxm0nvhvUz0ndso8o+jpnaKwoPvkObPXS5+jONG
BVNW1Wv+URn0Kqhiu3x/lI2IsRBtx3HYNxpzAoiW8RBr4OdwVt/iV7JGnqwG49Rg
SS5dkgptFD3foB/0w2oOCgbTOHqjeDxdkhF9V5pdzfRlO7pjY9tnUlCC67y5oL5i
VIoGulyCXZtbIklYi+CjQlOMDrBm5RLxNDn1THN1qth8F2RUpS4CFvEvySwwpsxO
bezfXOwFH24EG6JaCXngL1j/xRDrIml95ys/MiLjRCxZaUqGiZwz7LyeUVxNGZUF
uUkBJM6QCSRHIwN5/LpICH+heg6pqJjJd1JDre0vt+s+VM8Ak4VUD6i7nf+wDpSd
Vhmi+CR5swKbeKcaErmuAtVwVQkGlu/MOMi42FM4b1lkM9f2dLG6ijamM61NbWHH
mU5XYh1v6DXdASoMUZALNIbxIvrBOgJTnPBqd7sh05pGDKMucgMRfFizjn2cRqMH
Kr5IwCbMsdCcyMWaHCP92badnungc4ydO5AnZNdLAitcCCHUS/u/1tqB+ko1tSP9
TXI6dHamroXiLHYW6g1nmNrWP5sVJWhVQaNVNUW9LYSnyRedMqw=
=CJrb
-----END PGP SIGNATURE-----

--xpv8TnpvEhYYsRNsH5owuUKPNImhXei27--

