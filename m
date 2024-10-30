Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 02A359B6A9D
	for <lists+samba-technical@lfdr.de>; Wed, 30 Oct 2024 18:15:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=0usVrK+ynNLzTJ+c320XVNglA7gSb2OZm2gRxFC5dCQ=; b=nIiL9s/zAw/Z+nTvqG1Ro+xcEs
	JCvAtn4RrkTpIehpSPmvRZFXWj9irYK2Y7m30b6x5qbAGu41bYVSmOlB0akBquzMn3ycVI1A96U2Z
	7u4VL2qEMF8iZxWdYueVz/geP5ZfuFAM/lSAcYW98oXBic0Axs11db7E0q/GPH3eC8CShIaUjFzO4
	zBQwQIck0rbMyAfJ9rDFHfUHIVUJYa0062jIZO0mPKAJBuNJoZdvYJd5Kt2a/YF5k78Sgq04HP4IS
	wXm6P/QPsD5sSjxh/ZLnkPUOW8Pyrf0/dnSUD3wWlmlHm5ZraurobTNb0de+oHyhoRrt3jvtJK9yb
	wdMgdXjw==;
Received: from ip6-localhost ([::1]:46430 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1t6CHx-005aza-Do; Wed, 30 Oct 2024 17:15:21 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:60484) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1t6CHo-005azS-Ag
 for samba-technical@lists.samba.org; Wed, 30 Oct 2024 17:15:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:To:From:Date:CC;
 bh=0usVrK+ynNLzTJ+c320XVNglA7gSb2OZm2gRxFC5dCQ=; b=iSkftEry7TrNefE/xtIM0hTYKB
 lxzIqGer967mMKM2Aw36NKB+LOmoa5Irsx5ryPWAYyEzr7jAPSSRqA5zCqLAwHmxKbge2cuT61EP2
 NAwuU+1tbG2mVgSDKn3IrDq8lLXxFJ/MRjPtvpk1mEQzMrV6ybwTvpwGWDwFfIyEUA+iac/QRvVpR
 gjTegMSAghHzwAJwsCQJK20fz43bgdh+IR3DsH8Qe+r5UfP0ZYfaBNpaaezj6/0Onjax0BwtvBvb2
 O/q8xjF8h/wSfyxnpoRo6ekUkZA1SlbDDYxp+f2O9YXH/NBwmTeD538ie/Ib3UHwg+QzNnfsSRsie
 ep1F6N767a9yGuT35i61P0vzba2nAHPtI1FGF7jzpgfKHGAggiYOD52jgwkim/n5YnHy0/P1nCC04
 OznoW01zHGPfzCXQSxSA3nzuihQqAbBYB+BtCsyM3i8lnTGQyG0qgLVypUUHi91IIdphVt3hLMbA+
 7FqnFYBkpxa+vphbyfv52uJ9;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1t6CHm-008N5K-2h for samba-technical@lists.samba.org;
 Wed, 30 Oct 2024 17:15:11 +0000
Date: Wed, 30 Oct 2024 17:15:07 +0000
To: samba-technical@lists.samba.org
Subject: Re: authentication policies in Samba 4.21
Message-ID: <20241030171507.5d092646@devstation.samdom.example.com>
In-Reply-To: <cc717f18-2a82-4d46-959c-27da326a047f@kania-online.de>
References: <df1213a5-5153-463b-bacd-5d93ff8d2f6b@kania-online.de>
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
 <70db5ba2-8cfc-42f4-a493-0228954debdb@kania-online.de>
 <84bb05ba-823e-40a7-ba6b-d3c7ec6f2af1@catalyst.net.nz>
 <664df4a2-5133-4094-a233-5c6838413072@kania-online.de>
 <898167c5-b7d7-4bb2-9f3e-979f41608bb4@kania-online.de>
 <489883dd-1318-4172-b0b0-0f379714f927@catalyst.net.nz>
 <cc717f18-2a82-4d46-959c-27da326a047f@kania-online.de>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
From: Rowland Penny via samba-technical <samba-technical@lists.samba.org>
Reply-To: "samba@lists.samba.org" <samba@lists.samba.org>
Cc: Rowland Penny <rpenny@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Wed, 30 Oct 2024 17:57:21 +0100
Stefan Kania via samba-technical <samba-technical@lists.samba.org>
wrote:

> Hi Douglas
>=20
> Am 30.10.24 um 02:39 schrieb Douglas Bagnall via samba-technical:
> > On 30/10/24 06:33, Stefan Kania wrote:
> >> I still not getting it working like expected. I now set up a
> >> Windows AD (Server 2022)to test it and get the ldap output for the
> >> user, the computer, the policy and the silo. I will post it here
> >> as soon as I'm finished to compare the results.
> >=20
> > Here is the next pitfall. With
> >=20
> >  =C2=A0 samba-tool domain auth policy modify --name win11-policy \
> >  =C2=A0=C2=A0 --computer-allowed-to-authenticate-to \
> >  =C2=A0=C2=A0=C2=A0 'O:SYG:SYD:(XA;OICI;CR;;;WD;(@USER.ad://ext/Authent=
icationSilo
> > !=3D "win11-silo"))'
> >=20
> > the '(@USER.ad://ext/AuthenticationSilo !=3D "win11-silo")' condition
> > will first look for '@USER.ad://ext/AuthenticationSilo'. If it does
> > not exist (the user is in no silo) this will fail, and the
> > condition will default to not-allowing.
> >=20
> > In effect this condition says the user needs to be in a silo that
> > isn't "win11-silo".
>=20
> Yes, I know that was something I tried.
>=20
> Now I have configured the auth-policy and auth-silo on a Windows=20
> 2022-server Active Directory. I used the same names, so it is easy to=20
> follow. Here you see what I get when searching for the user, the
> client, the silo and the policy:
> ------------------------
> root@debclient:~# ldbsearch -H ldap://win2022.winexample.net
> '(|(CN=3Dst ka)(CN=3Dwin11*)(cn=3Dwinclient11))' --cross-ncs -U
> administrator Password for [WINEXAMPLE\administrator]:
> # record 1
> dn: CN=3Dwin11-policy,CN=3DAuthN Policies,CN=3DAuthN Policy=20
> Configuration,CN=3DServices,CN=3DConfiguration,DC=3Dwinexample,DC=3Dnet
> objectClass: top
> objectClass: msDS-AuthNPolicy
> cn: win11-policy
> distinguishedName: CN=3Dwin11-policy,CN=3DAuthN Policies,CN=3DAuthN Polic=
y=20
> Configura
>   tion,CN=3DServices,CN=3DConfiguration,DC=3Dwinexample,DC=3Dnet
> instanceType: 4
> whenCreated: 20241030153647.0Z
> whenChanged: 20241030161452.0Z
> uSNCreated: 20506
> uSNChanged: 24650
> name: win11-policy
> objectGUID: 37e6612a-15bf-4540-b1b2-db136a1cb877
> objectCategory:=20
> CN=3Dms-DS-AuthN-Policy,CN=3DSchema,CN=3DConfiguration,DC=3Dwinexample
>   ,DC=3Dnet
> dSCorePropagationData: 20241030153647.0Z
> dSCorePropagationData: 16010101000000.0Z
> msDS-UserAllowedToAuthenticateTo::=20
> AQAEgBQAAAAgAAAAAAAAACwAAAABAQAAAAAABRIAAAA
>   BAQAAAAAABRIAAAACAHgAAQAAAAkDcAAAAQAAAQEAAAAAAAEAAAAAYXJ0ePk2AAAAYQBkAD=
oALwAv
>   AGUAeAB0AC8AQQB1AHQAaABlAG4AdABpAGMAYQB0AGkAbwBuAFMAaQBsAG8AEBQAAAB3AGk=
AbgAxA
>   DEALQBzAGkAbABvAIAAAAA=3D
> msDS-UserAllowedToAuthenticateFrom::=20
> AQAEgBQAAAAgAAAAAAAAACwAAAABAQAAAAAABRIAA
>   AABAQAAAAAABRIAAAACAHgAAQAAAAkDcAAAAQAAAQEAAAAAAAEAAAAAYXJ0ePk2AAAAYQBk=
ADoALw
>   AvAGUAeAB0AC8AQQB1AHQAaABlAG4AdABpAGMAYQB0AGkAbwBuAFMAaQBsAG8AEBQAAAB3A=
GkAbgA
>   xADEALQBzAGkAbABvAIAAAAA=3D
> msDS-UserTGTLifetime: 72000000000
> msDS-ComputerAllowedToAuthenticateTo::=20
> AQAEgBQAAAAgAAAAAAAAACwAAAABAQAAAAAABRI
>   AAAABAQAAAAAABRIAAAACAHgAAQAAAAkDcAAAAQAAAQEAAAAAAAEAAAAAYXJ0ePk2AAAAYQ=
BkADoA
>   LwAvAGUAeAB0AC8AQQB1AHQAaABlAG4AdABpAGMAYQB0AGkAbwBuAFMAaQBsAG8AEBQAAAB=
3AGkAb
>   gAxADEALQBzAGkAbABvAIAAAAA=3D
> msDS-ServiceAllowedToAuthenticateTo::=20
> AQAEgBQAAAAgAAAAAAAAACwAAAABAQAAAAAABRIA
>   AAABAQAAAAAABRIAAAACAHgAAQAAAAkDcAAAAQAAAQEAAAAAAAEAAAAAYXJ0ePk2AAAAYQB=
kADoAL
>   wAvAGUAeAB0AC8AQQB1AHQAaABlAG4AdABpAGMAYQB0AGkAbwBuAFMAaQBsAG8AEBQAAAB3=
AGkAbg
>   AxADEALQBzAGkAbABvAIAAAAA=3D
> msDS-ServiceAllowedToAuthenticateFrom::=20
> AQAEgBQAAAAgAAAAAAAAACwAAAABAQAAAAAABR
>   IAAAABAQAAAAAABRIAAAACAHgAAQAAAAkDcAAAAQAAAQEAAAAAAAEAAAAAYXJ0ePk2AAAAY=
QBkADo
>   ALwAvAGUAeAB0AC8AQQB1AHQAaABlAG4AdABpAGMAYQB0AGkAbwBuAFMAaQBsAG8AEBQAAA=
B3AGkA
>   bgAxADEALQBzAGkAbABvAIEAAAA=3D
> msDS-UserAuthNPolicyBL: CN=3Dwin11-silo,CN=3DAuthN Silos,CN=3DAuthN Polic=
y=20
> Configura
>   tion,CN=3DServices,CN=3DConfiguration,DC=3Dwinexample,DC=3Dnet
> msDS-ComputerAuthNPolicyBL: CN=3Dwin11-silo,CN=3DAuthN Silos,CN=3DAuthN
> Policy Confi
>   guration,CN=3DServices,CN=3DConfiguration,DC=3Dwinexample,DC=3Dnet
> msDS-ServiceAuthNPolicyBL: CN=3Dwin11-silo,CN=3DAuthN Silos,CN=3DAuthN
> Policy Config
>   uration,CN=3DServices,CN=3DConfiguration,DC=3Dwinexample,DC=3Dnet
> msDS-AuthNPolicyEnforced: TRUE
> msDS-UserAllowedNTLMNetworkAuthentication: FALSE
> msDS-ServiceAllowedNTLMNetworkAuthentication: FALSE
> msDS-StrongNTLMPolicy: 0
>=20
> # record 2
> dn: CN=3Dwin11-silo,CN=3DAuthN Silos,CN=3DAuthN Policy=20
> Configuration,CN=3DServices,CN=3DConfiguration,DC=3Dwinexample,DC=3Dnet
> objectClass: top
> objectClass: msDS-AuthNPolicySilo
> cn: win11-silo
> distinguishedName: CN=3Dwin11-silo,CN=3DAuthN Silos,CN=3DAuthN Policy=20
> Configuration,
>   CN=3DServices,CN=3DConfiguration,DC=3Dwinexample,DC=3Dnet
> instanceType: 4
> whenCreated: 20241030154104.0Z
> whenChanged: 20241030162958.0Z
> uSNCreated: 20511
> uSNChanged: 24683
> name: win11-silo
> objectGUID: b2ea79d2-8187-4a35-9839-6a807016857d
> objectCategory:=20
> CN=3Dms-DS-AuthN-Policy-Silo,CN=3DSchema,CN=3DConfiguration,DC=3Dwinex
>   ample,DC=3Dnet
> dSCorePropagationData: 20241030154104.0Z
> dSCorePropagationData: 16010101000000.0Z
> msDS-AssignedAuthNPolicySiloBL:
> CN=3DWINCLIENT11,OU=3Dfirma,DC=3Dwinexample,DC=3Dnet
> msDS-AssignedAuthNPolicySiloBL: CN=3Dst
> ka,OU=3Dfirma,DC=3Dwinexample,DC=3Dnet msDS-AssignedAuthNPolicySiloBL:
> CN=3DWIN2022,OU=3DDomain Controllers,DC=3Dwinexample ,DC=3Dnet
> msDS-AuthNPolicySiloMembers:
> CN=3DWINCLIENT11,OU=3Dfirma,DC=3Dwinexample,DC=3Dnet
> msDS-AuthNPolicySiloMembers: CN=3Dst ka,OU=3Dfirma,DC=3Dwinexample,DC=3Dn=
et
> msDS-UserAuthNPolicy: CN=3Dwin11-policy,CN=3DAuthN Policies,CN=3DAuthN
> Policy Config
> uration,CN=3DServices,CN=3DConfiguration,DC=3Dwinexample,DC=3Dnet
> msDS-ComputerAuthNPolicy: CN=3Dwin11-policy,CN=3DAuthN Policies,CN=3DAuthN
> Policy Co
> nfiguration,CN=3DServices,CN=3DConfiguration,DC=3Dwinexample,DC=3Dnet
> msDS-ServiceAuthNPolicy: CN=3Dwin11-policy,CN=3DAuthN Policies,CN=3DAuthN
> Policy Con
> figuration,CN=3DServices,CN=3DConfiguration,DC=3Dwinexample,DC=3Dnet
> msDS-AuthNPolicySiloEnforced: TRUE
>=20
> # record 3
> dn: CN=3Dst ka,OU=3Dfirma,DC=3Dwinexample,DC=3Dnet
> objectClass: top
> objectClass: person
> objectClass: organizationalPerson
> objectClass: user
> cn: st ka
> sn: ka
> givenName: st
> distinguishedName: CN=3Dst ka,OU=3Dfirma,DC=3Dwinexample,DC=3Dnet
> instanceType: 4
> whenCreated: 20241030135710.0Z
> whenChanged: 20241030161239.0Z
> displayName: st ka
> uSNCreated: 12810
> memberOf: CN=3Dmygroup,OU=3Dfirma,DC=3Dwinexample,DC=3Dnet
> memberOf: CN=3DProtected Users,CN=3DUsers,DC=3Dwinexample,DC=3Dnet
> memberOf::
> Q049RG9tw6RuZW4tQWRtaW5zLENOPVVzZXJzLERDPXdpbmV4YW1wbGUsREM9bmV0
> uSNChanged: 24649 name: st ka
> objectGUID: ec0bc2f7-f670-45f6-b58b-e1f93c0121e2
> userAccountControl: 66048
> badPwdCount: 0
> codePage: 0
> countryCode: 0
> badPasswordTime: 0
> lastLogoff: 0
> lastLogon: 133747795013375240
> pwdLastSet: 133747702303167784
> primaryGroupID: 513
> objectSid: S-1-5-21-876824351-968303257-185465824-1103
> adminCount: 1
> accountExpires: 9223372036854775807
> logonCount: 41
> sAMAccountName: stka
> sAMAccountType: 805306368
> userPrincipalName: stka@winexample.net
> objectCategory:
> CN=3DPerson,CN=3DSchema,CN=3DConfiguration,DC=3Dwinexample,DC=3Dnet
> dSCorePropagationData: 20241030161239.0Z dSCorePropagationData:
> 20241030135710.0Z dSCorePropagationData: 16010101000000.0Z
> lastLogonTimestamp: 133747742703371877
> msDS-AssignedAuthNPolicySilo: CN=3Dwin11-silo,CN=3DAuthN Silos,CN=3DAuthN=
=20
> Policy Con
>   figuration,CN=3DServices,CN=3DConfiguration,DC=3Dwinexample,DC=3Dnet
> msDS-AuthNPolicySiloMembersBL: CN=3Dwin11-silo,CN=3DAuthN Silos,CN=3DAuth=
N=20
> Policy Co
>   nfiguration,CN=3DServices,CN=3DConfiguration,DC=3Dwinexample,DC=3Dnet
>=20
> # record 4
> dn: CN=3DWINCLIENT11,OU=3Dfirma,DC=3Dwinexample,DC=3Dnet
> objectClass: top
> objectClass: person
> objectClass: organizationalPerson
> objectClass: user
> objectClass: computer
> cn: WINCLIENT11
> distinguishedName: CN=3DWINCLIENT11,OU=3Dfirma,DC=3Dwinexample,DC=3Dnet
> instanceType: 4
> whenCreated: 20241030141150.0Z
> whenChanged: 20241030154310.0Z
> uSNCreated: 16410
> uSNChanged: 20519
> name: WINCLIENT11
> objectGUID: 36b6c9a2-6297-452f-ac43-a6cb46635e63
> userAccountControl: 4096
> badPwdCount: 0
> codePage: 0
> countryCode: 0
> badPasswordTime: 0
> lastLogoff: 0
> lastLogon: 133747794979471652
> localPolicyFlags: 0
> pwdLastSet: 133747711109077000
> primaryGroupID: 515
> objectSid: S-1-5-21-876824351-968303257-185465824-1106
> accountExpires: 9223372036854775807
> logonCount: 50
> sAMAccountName: WINCLIENT11$
> sAMAccountType: 805306369
> operatingSystem: Windows 11 Pro
> operatingSystemVersion: 10.0 (22631)
> dNSHostName: winclient11.winexample.net
> servicePrincipalName: RestrictedKrbHost/WINCLIENT11
> servicePrincipalName: HOST/WINCLIENT11
> servicePrincipalName: RestrictedKrbHost/winclient11.winexample.net
> servicePrincipalName: HOST/winclient11.winexample.net
> objectCategory:
> CN=3DComputer,CN=3DSchema,CN=3DConfiguration,DC=3Dwinexample,DC=3Dnet
> isCriticalSystemObject: FALSE dSCorePropagationData: 20241030141321.0Z
> dSCorePropagationData: 16010101000000.0Z
> lastLogonTimestamp: 133747711110786794
> msDS-SupportedEncryptionTypes: 28
> msDS-AssignedAuthNPolicySilo: CN=3Dwin11-silo,CN=3DAuthN Silos,CN=3DAuthN=
=20
> Policy Con
>   figuration,CN=3DServices,CN=3DConfiguration,DC=3Dwinexample,DC=3Dnet
> msDS-AuthNPolicySiloMembersBL: CN=3Dwin11-silo,CN=3DAuthN Silos,CN=3DAuth=
N=20
> Policy Co
>   nfiguration,CN=3DServices,CN=3DConfiguration,DC=3Dwinexample,DC=3Dnet
>=20
> ------------------------
> and this is working :-)
> As you can see, the policy is using UserAllowedToAuthenticateTo and
> the assignment is different to the one we have in Samba
>=20
> Here the value from UserAllowedToAuthenticateTo:
> --------------
> root@debclient:~# ldbsearch -H ldap://win2022.winexample.net
> '(|(CN=3Dst ka)(CN=3Dwin11*)(cn=3Dwinclient11))' --cross-ncs=20
> msDS-UserAllowedToAuthenticateTo  -U administrator=20
>=20
> Password for [WINEXAMPLE\administrator]:
> # record 1
> dn: CN=3Dwin11-policy,CN=3DAuthN Policies,CN=3DAuthN Policy=20
> Configuration,CN=3DServices,CN=3DConfiguration,DC=3Dwinexample,DC=3Dnet
> msDS-UserAllowedToAuthenticateTo::=20
> AQAEgBQAAAAgAAAAAAAAACwAAAABAQAAAAAABRIAAAA=20
> BAQAAAAAABRIAAAACAHgAAQAAAAkDcAAAAQAAAQEAAAAAAAEAAAAAYXJ0ePk2AAAAYQBkADoA=
LwAv=20
> AGUAeAB0AC8AQQB1AHQAaABlAG4AdABpAGMAYQB0AGkAbwBuAFMAaQBsAG8AEBQAAAB3AGkAb=
gAxA
>   DEALQBzAGkAbABvAIAAAAA=3D
> --------------
> I don't know how to translate the Attribut so that it is readable. If=20
> you could give me a hint, i translate it, so that you can read it. It=20
> should a base64 string but I can't convert it.
>=20

Try adding '--show-binary' to the ldbsearch command

Rowland

