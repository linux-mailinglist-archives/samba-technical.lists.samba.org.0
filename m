Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 349B89B3E56
	for <lists+samba-technical@lfdr.de>; Tue, 29 Oct 2024 00:19:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=Z62qVOOlGXTAoICWqoMpVJmaWGhOmidojV6gCWOKbxU=; b=DQcdYPVW5aPUvRn7DRnb9ydFqk
	S5KWR3E8mPKhOZyNQ7JviETskth2dcYB4T4p3kISOiusIgqupPzbpbgstO1HaFl29jCShhYkGgTRY
	qAk85BSIa0gseKIHXWN1pEaUjqyn1aB3+f7FUNKsDGMkC2H92iVbsJv7NORKUOckShx4iCg3sHv7a
	2q4pi+taS2fkMU98wYHiNdJ3ih3OSbwfWHpy1F84LKqOGYcWmMSvPjf7WLL8rRUP86FkgSZNTJm3V
	psw2L6aofsDtMec2YpOYUdXzuZQL9b0NckmQ0HqhzPBdIe88EpQk1SOcTrG4SiDrr/6ppaQG+6g49
	4cNh/k6Q==;
Received: from ip6-localhost ([::1]:48370 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1t5Z19-005Oxz-0N; Mon, 28 Oct 2024 23:19:23 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:26202) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1t5Z14-005Oxs-Da
 for samba-technical@lists.samba.org; Mon, 28 Oct 2024 23:19:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=ky5SD8ZMIVce6KY/pNI8Rsz76FbBKQQiZJApHx1Vg1s=; b=WV5y1cmgf+B9I1LZpeUKJHgVQ6
 dAnUDaFqdtv/ND7Dk1a5Q7+ZBQbQ5PK0cLIMTiD2QN+NUtTFkmrgV+Lh9n99UCFX5hu3jkzMZgAV3
 Gs2Z5jxrE7e6JCB8nxSFeIOLyvKBtX199g+6uWO+2Rj0Di5QEyoKxePKqP16xRuHwaTMMqvLwekLM
 ZzUCIacXnVoHT+Ejg9nWiEA/AYb4JnbITRQUA4FQnLExoVksyTp7RC9ElcZtDFK+4lowQwfLdndZg
 NuJITbU2BfFS+CqoE1ebN2ZnyRvYxSammm6Shdh4D4SyhsJP0eD9lgPbEQnofqa+P09DFnyjjF1cQ
 lhqSIyQ6OmPDmbsqp8w4EaKPikO8vwJoPieVhgcvdbTXVOX+7O5Z7ODOw1aIJLR4izemBkGFT9tCI
 2TvaiV2ug5IJ3ypEKRdDvqrIPV4p9W5sja0ODMyfOuo0S9iaX5gytZmCIQn/jUtd1D3TaeDQ5b2eY
 12mk8T3jeR4CuaPyKrCSKX7S;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1t5Z12-0071er-1a; Mon, 28 Oct 2024 23:19:16 +0000
Message-ID: <8499f04d71a8b01b56e4c5a69fb67f6887314d0a.camel@samba.org>
Subject: Re: authentication policies in Samba 4.21
To: Douglas Bagnall <douglas.bagnall@catalyst.net.nz>, Stefan Kania
 <stefan@kania-online.de>, samba-technical <samba-technical@lists.samba.org>
Date: Tue, 29 Oct 2024 12:19:12 +1300
In-Reply-To: <0f4e2d3b-12b2-4dfc-88ef-0b52c12bf6db@catalyst.net.nz>
References: <df1213a5-5153-463b-bacd-5d93ff8d2f6b@kania-online.de>
 <297faa9c-6788-436b-bfb3-8d2107b8596d@catalyst.net.nz>
 <48c2847c-7d05-4e1a-9e85-52b1ba5d0b30@catalyst.net.nz>
 <ef60d0ef-25df-4081-9764-5dbc05bfc655@kania-online.de>
 <1eb80efc-4bb2-4b7c-b339-5b92277e782e@samba.org>
 <49b4b9af-033a-4534-90e3-ac633ff8bfd8@kania-online.de>
 <7bf96a40-7472-47ca-b81c-7e9121c598b4@samba.org>
 <68fe1182-281f-42ea-ac18-b0a2bf49961d@samba.org>
 <afa75a49-2ae4-4e14-9363-d5c31d7ef2a9@kania-online.de>
 <b5f3c39b-43c8-4b43-943d-cd851128173c@kania-online.de>
 <5d10619f-c4ed-4190-a4d1-1cec480ee108@catalyst.net.nz>
 <c420e24b-562d-4592-a9df-d0dddd069e22@kania-online.de>
 <ab589c2f-f13b-4560-bd18-7a1e88634a0d@catalyst.net.nz>
 <1a14a7d4-3d56-4212-9420-0affed9ffd18@kania-online.de>
 <0f4e2d3b-12b2-4dfc-88ef-0b52c12bf6db@catalyst.net.nz>
User-Agent: Evolution 3.52.4 (3.52.4-1.fc40) 
MIME-Version: 1.0
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
From: Andrew Bartlett via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andrew Bartlett <abartlet@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tue, 2024-10-29 at 11:26 +1300, Douglas Bagnall via samba-technical
wrote:
> On 29/10/24 02:29, Stefan Kania wrote:
> > Starting from the beginning. Set up the Domain with:
> > samba-tool domain provision --domain=3Dexample --real=3Dexample.net --h=
ost-ip=3D192.168.56.21 --backend-store=3Dmdb
> > --dns-backend=3DBIND9_DLZ --adminpass=3DPassw0rd --function-level=3D201=
6 --option=3D"ad dc functional level =3D 2016"
> >=20
> > Create some users and groups.
> >=20
> > Then start the show:
> > -------------------------
> > Creating the two GPO
> > 1. default domain controller policy
> > Setting=C2=A0 KDC for claims
>=20
> I'm not actually sure what this part does (which is normal for me and GPO=
s).
>=20
> > 2. default domain policy
> > Setting Kerberos for claims
> >=20
> > 3. All steps to create the auth-policy and auth-silo and assigning the =
policy
> > samba-tool domain=C2=A0 auth policy create --name win11-policy --enforc=
e
> > samba-tool domain=C2=A0 auth policy modify --user-tgt-lifetime-mins=3D9=
0 --name win11-policy
> > samba-tool domain auth silo create --name win11-silo --enforce
> > samba-tool domain auth silo member grant --name win11-silo --member=3Ds=
tka
>=20
> At this point you should be able to see the silo claim in a new kerberos =
ticket,
> using `net ads kerberos pac dump  -Ustka`.
>=20
> > samba-tool domain auth silo member grant --name win11-silo --member=3DW=
INCLIENT11\$
> > samba-tool domain=C2=A0 auth policy user-allowed-to-authenticate-to set=
 --by-silo=3Dwin11-silo --name=3Dwin11-policy
>=20
>  *computer-allowed-to-authenticate-to
>=20
> It would have been better for us to name this
>=20
>   allowed-to-authenticate-to-computer
>=20
> but I guess we are following the object names from Microsoft.

We did, but fixing the names shown in our user interface would be
reasonable to consider.=C2=A0

Andrew,

--=20
Andrew Bartlett (he/him) https://samba.org/~abartlet/
Samba Team Member (since 2001) https://samba.org
Samba Developer, Catalyst IT https://catalyst.net.nz/services/samba

