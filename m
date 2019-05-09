Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::443:1])
	by mail.lfdr.de (Postfix) with ESMTPS id 94127186F7
	for <lists+samba-technical@lfdr.de>; Thu,  9 May 2019 10:46:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=t8v7Yuxcgn+yAi3BNYHQd/yXyBIOz2cBy4Rx149doNk=; b=LPqcc7MA7vp8xfJ85U9gZyNhBE
	LssNIg71762dYKl9UjyfXHSF0DLMrylwod1+Wp2trwEJET71uO5uNIbtt+XJpAk+BgqTQ6lme4Lbn
	M1uxWkGCvtVvXnVOdv3bAZgL9yly1PNFoLNMr0MsJONbzfMRhX6DE5tGTn4m9zxumAohPNPY6aabv
	oCB4Cxo9zin31wo509b84Gw1nLNxp5GZjqRP08cu7ttrA8wRvowYb/JKeYbldq1FffdH65fgAlGbG
	jqKsOr+8rWKtVVDZh2gOi+4PFCO2SiGPsah71DQ0eTDLLTBgX7nrzGxE+sHkh26EuW0Zx32lw8zFO
	vpmX7jyw==;
Received: from localhost ([::1]:43728 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hOehB-0034PO-95; Thu, 09 May 2019 08:46:29 +0000
Received: from zmmta2.univ-littoral.fr ([195.220.130.148]:38036) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hOeh4-0034PH-7S
 for samba-technical@lists.samba.org; Thu, 09 May 2019 08:46:25 +0000
Received: from localhost (localhost [127.0.0.1])
 by zmmta2.univ-littoral.fr (Postfix) with ESMTP id 9A0851355CC
 for <samba-technical@lists.samba.org>; Thu,  9 May 2019 10:46:19 +0200 (CEST)
X-Spam-Flag: NO
X-Spam-Score: -3.009
Authentication-Results: zmmta2.univ-littoral.fr (amavisd-new);
 dkim=pass (1024-bit key) header.d=univ-littoral.fr
Received: from zmmta2.univ-littoral.fr ([127.0.0.1])
 by localhost (zmmta2.univ-littoral.fr [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id SiQ4L2JPFK2i for <samba-technical@lists.samba.org>;
 Thu,  9 May 2019 10:46:18 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zmmta2.univ-littoral.fr (Postfix) with ESMTP id AF7A1135AA5
 for <samba-technical@lists.samba.org>; Thu,  9 May 2019 10:46:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.9.2 zmmta2.univ-littoral.fr AF7A1135AA5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=univ-littoral.fr;
 s=08AB4CC0-EC74-11E6-899C-5B0ECAA5E567; t=1557391578;
 bh=hf7/XJq61U1136qboTPd21e9M0bYwnsSFu2uC6p7R4E=;
 h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type;
 b=pln8i0oiLegm2jCmDbMcis9ZPJ7RSKWERlLyqI0OaGmFgsxQL/4pnV8jmCI9VwmE6
 AjC2t4DUtJYnm+Fmj2+QAMqL+EgjUWgG2QNR2baIR7tFwXqduntjWEjchYXFNVTU38
 4K0Yx5GLVzjJxQDSJ7kjPYnA+5Q8Y1rpJEAgXOqA=
Received: from zmmta2.univ-littoral.fr ([127.0.0.1])
 by localhost (zmmta2.univ-littoral.fr [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id zx4KM_cbqjYO for <samba-technical@lists.samba.org>;
 Thu,  9 May 2019 10:46:18 +0200 (CEST)
Received: from [193.49.201.237] (grizzly.univ-littoral.fr [193.49.201.237])
 by zmmta2.univ-littoral.fr (Postfix) with ESMTPSA id 70A9D1355CC
 for <samba-technical@lists.samba.org>; Thu,  9 May 2019 10:46:17 +0200 (CEST)
Subject: Re: debian 10: I can not integrate a linux machine into a Samba Ad
To: samba-technical@lists.samba.org
References: <ed478625-1c87-295f-bff2-e579f0f919f6@univ-littoral.fr>
 <20190509092518.1c8e2995@devstation.samdom.example.com>
Message-ID: <d654e00d-c17b-10bf-3189-713f86fab44d@univ-littoral.fr>
Date: Thu, 9 May 2019 10:46:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190509092518.1c8e2995@devstation.samdom.example.com>
Content-Language: fr-FR
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Content-Filtered-By: Mailman/MimeDel 2.1.23
X-BeenThere: samba-technical@lists.samba.org
X-Mailman-Version: 2.1.23
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
From: nathalie ramat via samba-technical <samba-technical@lists.samba.org>
Reply-To: nathalie ramat <nathalie.ramat@univ-littoral.fr>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Thank you for your response . sorry for using the wrong list.



Le 09/05/2019 =C3=A0 10:25, Rowland Penny via samba-technical a =C3=A9cri=
t=C2=A0:
> See inline comments:
>
> On Thu, 9 May 2019 09:29:05 +0200
> nathalie ramat via samba-technical <samba-technical@lists.samba.org>
> wrote:
>
>
>> I configured smb.conf at my server :
> Er, no, you misconfigured your smb.conf on the DC ;-)
>
>> # global parameters
>> [global]
>>        winbind enum users =3D yes
>>        winbind enum groups =3D yes
>>        winbind use default domain =3D yes
>>        winbind separator =3D /
>>        idmap config *:backend =3D tdb
>>        idmap config *:range =3D 1000-19000=C3=83=C2=83=C3=82=C2=A9r=C3=
=83=C2=83=C3=82=C2=A9 correctement semble-t-il.
>>        host msdfs =3D no
>>        security =3D user
>>        name resolve order =3D host
>> #    ntlm auth =3D yes
>> #     raw NTLMV2 auth =3D yes
>> #    lanman auth =3Dyes
>> #    vfs objects =3D acl_xattr
>>        map acl inherit =3D Yes
>> #    store dos attributes =3D Yes
> I would suggest you remove the above lines, they either have no place
> in A Samba AD DC or slow things down.
>
>> and my linux user :
>>
>> [global]
>>        security =3D ads
>>        realm =3D lenzspitze.calais.fr
> Change the realm to uppercase
>
>>        workgroup =3D LENZSPITZE
>>        netbios name =3D testbugster
>>        winbind separator =3D /
>>        ntlm auth =3D yes
>>        idmap uid =3D 0-50000
>>        idmap gid =3D 0-50000
> No, that's the old way of doing things
>
>>        winbind enum users =3D yes
>>        winbind enum groups =3D yes
> Once everything is working, remove the two lines above, they are only
> required for testing purposes.
>
>>        idmap config LENZSPITZE : backend =3D rid
>>        idmap config LENZSPITZE : base_rid =3D 0
> You do not have to set the base_rid, but what you do have to do, set
> the 'idmap config' lines. See here:
>
> https://wiki.samba.org/index.php/Setting_up_Samba_as_a_Domain_Member
>
> Finally, you really should have posted this to the samba mailing list,
> not to the samba-technical list
>
> Rowland
>
>

--=20
Nathalie RAMAT-LECLERCQ

Service Informatique

Universite du Littoral-C=C3=B4te d'Opale
SCoSI - Service Commun du Syst=C3=A8me d'Information
P=C3=B4le Syst=C3=A8mes et r=C3=A9seaux

Centre de Gestion Universitaire de Calais
50 rue ferdinand Buisson
C.S 80699
62228 CALAIS CEDEX





