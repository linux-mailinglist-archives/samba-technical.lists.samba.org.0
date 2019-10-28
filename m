Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 45887E7953
	for <lists+samba-technical@lfdr.de>; Mon, 28 Oct 2019 20:39:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=c8SIBKdE2Eex7oQmSd16QYrFgBbXakYDZOPIt8JJpXM=; b=Q5XIYXDZ5nLRuAbzeAs18nh0A9
	Pqy0+juNncfiEI0YY0DLG/qg7Cg1nAFsf2ARODIt2pMAyMFd0Ido8o8ChGX8jnat+elB50xmBFh8D
	BWIshVEtB0h3GbY/ilRGpYdg/fvhxmt4TL+XHMlEhv1NCRsgVsUteqJ9wUMsc5Sczk7wh/EwBwcel
	xlcLpH5Eqhg6u15b65KT4W0580c79lijCYLYe5IEJkz3qmymhLjGqPk0tYOS9uum9pAUJOqqaJTUl
	rtZb+QTKla6kDxIQQ63oxvo3oNdeGLj5h27IZ7YrVe4P5dzedaV47+iVvrGHmegxs0uxTPeLo0Mjm
	B4XM3+mQ==;
Received: from localhost ([::1]:53854 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iPAqH-0030gB-QH; Mon, 28 Oct 2019 19:38:17 +0000
Received: from mail.rosalinux.ru ([195.19.76.54]:34938) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1iPAqC-0030ft-RS
 for samba-technical@lists.samba.org; Mon, 28 Oct 2019 19:38:15 +0000
Received: from localhost (localhost [127.0.0.1])
 by mail.rosalinux.ru (Postfix) with ESMTP id C28AFD46DFF2F;
 Mon, 28 Oct 2019 22:38:09 +0300 (MSK)
Received: from mail.rosalinux.ru ([127.0.0.1])
 by localhost (mail.rosalinux.ru [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id GnvV4mN6bp4X; Mon, 28 Oct 2019 22:38:08 +0300 (MSK)
Received: from localhost (localhost [127.0.0.1])
 by mail.rosalinux.ru (Postfix) with ESMTP id C5856D46DFF31;
 Mon, 28 Oct 2019 22:38:08 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rosalinux.ru C5856D46DFF31
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rosalinux.ru;
 s=A1AAD92A-9767-11E6-A27F-AC75C9F78EF4; t=1572291488;
 bh=c8SIBKdE2Eex7oQmSd16QYrFgBbXakYDZOPIt8JJpXM=;
 h=To:From:Message-ID:Date:MIME-Version;
 b=RjMdSS6UrxvetmRed5i+lzRz3OGEtIm3+gu8e7xNzsdyOEVV7pDZpwcwnTzMpeR28
 Ug7pqB0EQelDRhb6+aogZ7awJuzaD0xY3LwZGeY0RMQyla29/0NHgcvvuY7hNYMIUP
 AHAvGDMDaTb/00txkvBI4bGsPnfwR5BoNdvBvvvL1Ayzu9woj+NVeVgl9ydtRjGJHc
 Muky35rke5P+PVB25qrXiM2VD0Y8y9EwogF0p3Ed615a4UkYVuLtO3vAcZ08SRr9lc
 zkmLPlOH2ti6ZmwfiFPQUZzoy9eBbNRiUTI9CFts2xSztCqOMXExx63lMSm2yEx8RZ
 47uvBIdz8YeiA==
Received: from mail.rosalinux.ru ([127.0.0.1])
 by localhost (mail.rosalinux.ru [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id QX4lvfNGGikh; Mon, 28 Oct 2019 22:38:08 +0300 (MSK)
Received: from [192.168.1.173] (broadband-90-154-70-115.ip.moscow.rt.ru
 [90.154.70.115])
 by mail.rosalinux.ru (Postfix) with ESMTPSA id 996F4D46DFF2F;
 Mon, 28 Oct 2019 22:38:08 +0300 (MSK)
Subject: Re: Automating usage of smbspool_krb5_wrapper
To: Andreas Schneider <asn@samba.org>, samba-technical@lists.samba.org
References: <af8412ee-5493-0406-e95b-8d3175ec069a@rosalinux.ru>
 <dda32395-9ac0-9dad-5528-7f284f5101df@rosalinux.ru>
 <7837d34e-dd46-2f3e-c14c-c9bd6510b940@rosalinux.ru>
 <1853953.WXbCIQQCWo@magrathea>
Message-ID: <f21e078f-669f-6590-c0a1-f450f72200be@rosalinux.ru>
Date: Mon, 28 Oct 2019 22:38:08 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <1853953.WXbCIQQCWo@magrathea>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: ru-RU
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
From: Mikhail Novosyolov via samba-technical <samba-technical@lists.samba.org>
Reply-To: Mikhail Novosyolov <m.novosyolov@rosalinux.ru>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

28.10.2019 11:47, Andreas Schneider =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> On Monday, 28 October 2019 08:58:26 CET Mikhail Novosyolov via samba-te=
chnical
> wrote:
>> 28.10.2019 10:44, Mikhail Novosyolov =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>> <...>
>>> There are 2 possible solutions:
>>>
>>> 1) either patch source3/client/smbspool_krb5_wrapper.c to "goto
>>> smbspool;" if env does not contain "negotiate" instead of chekcing to
>>> be either null or 0 - how correct will this be?
>> I mean this:
>>
>> diff --git a/source3/client/smbspool_krb5_wrapper.c
>> b/source3/client/smbspool_krb5_wrapper.c
>> index bff1df417e8..000a613291e 100644
>> --- a/source3/client/smbspool_krb5_wrapper.c
>> +++ b/source3/client/smbspool_krb5_wrapper.c
>> @@ -149,7 +149,7 @@ int main(int argc, char *argv[])
>>           env =3D getenv("AUTH_INFO_REQUIRED");
>>
>>            /* If not set, then just call smbspool. */
>> -       if (env =3D=3D NULL || env[0] =3D=3D 0) {
>> +       if (env =3D=3D NULL || env =3D=3D "none" || env[0] =3D=3D 0) {
>>                   CUPS_SMB_DEBUG("AUTH_INFO_REQUIRED is not set - "
>>                                  "execute smbspool");
>>                   goto smbspool;
> This is obviously wrong :-)
>
> Did you see the code below? The question is if we should map
>
> AUTH_INFO_REQUIRED=3Dnone
>
> to anonymous. I've created a patchset you can find here:
>
> https://git.samba.org/?p=3Dasn/samba.git;a=3Dshortlog;h=3Drefs/heads/ma=
ster-smbspool
>
>
> However you need to try all combinations, username/password, kerberos a=
nd none
> for anonymous.

Thank you! I did not test these patches yet, first tried to understand=20
how it works.

Could you please explain a bit how it works?

About smbspool.

I see that AUTH_INFO_REQUIRED =3D=3D NULL (not set) and=20
AUTH_INFO_REQUIRED=3D"none" are treated differently.

Code of smbspool seems to try to guess authentication method if=20
AUTH_INFO_REQUIRED =3D=3D NULL. If username for authentication was provid=
e,=20
it will do the same as in case of=C2=A0 AUTH_INFO_REQUIRED =3D=3D "userna=
me,=20
password"
[ but will not print "DEBUG: Try to connect using username/password=20
...\n", maybe also print it? ].

If AUTH_INFO_REQUIRED =3D=3D NULL && ( username =3D=3D NULL || usernames'=
s=20
kerberos ccache is not valid ), then NT_STATUS_ACCESS_DENIED will be=20
returned. Why are you sure that it is not an anonymous connection if=20
AUTH_INFO_REQUIRED was not set? Does a situation with not set=20
AUTH_INFO_REQUIRED ever happen in CUPS? If it does, when does it happen?=20
I could not find any documentation and source code is not very clear.


As for smbspool_krb5_wrapper.

cmp =3D strcmp(env, "negotiate");
if (cmp !=3D 0) {
 =C2=A0=C2=A0=C2=A0 =C2=A0CUPS_SMB_ERROR("Authentication unsupported");
 =C2=A0=C2=A0=C2=A0 =C2=A0fprintf(stderr, "ATTR: auth-info-required=3Dneg=
otiate\n");
 =C2=A0=C2=A0=C2=A0 =C2=A0return CUPS_BACKEND_AUTH_REQUIRED;
}

If I understood corretly, this code will be executed after all other=20
_known_ possible values of variable AUTH_INFO_REQUIRED were tried.=20
CUPS_BACKEND_AUTH_REQUIRED will be returned if AUTH_INFO_REQUIRED is set=20
to a not known value. And this value seems to be possible not know, e.g.=20
job.c (https://github.com/apple/cups/blob/master/scheduler/job.c#L1017)=20
in cups can work with situations when it hasup up to 4 comma-separated=20
components, I don't know examples, but now smpspool_krb5_wrapper will=20
return CUPS_BACKEND_AUTH_REQUIRED.

If we intend to make smbspool_krb5_wrapper universal, I think "goto=20
smbspool;" should be done in cases of not clear AUTH_INFO_REQUIRED, not=20
exit with error.

Sorry if I misunderstood something. Thank you for quick patches!


