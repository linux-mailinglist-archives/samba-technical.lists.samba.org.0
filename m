Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 65FC13F3861
	for <lists+samba-technical@lfdr.de>; Sat, 21 Aug 2021 05:50:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=zHOVDDy6Elh+zfWbuB2hVkW/DiSiV2mlyNyWlRpko1k=; b=nXbzDEy6yHQLzh2RVqIbeyhSHY
	IKYmjuHZcTggNZSSbF4cejD3wtjw3G/t4LiSDhmdGPFv/fnRR6nxEpRjMeVbJwmw2/ikLMLbHCKEk
	86vNOUsShikCisaMUZfCDOla1JmtV3nYcfkPulIOCQVZEGB+yOpfEM6pR1fhZBa7TV4YxskZIdxKX
	IjurEZHBRS09FOCTO7dgTmlAeTBocImE+NIBmWRaWpcDAsttx+8RGdSoT7UJYGbhGdHQEnDuGYdl8
	Eg4KirEVrZubUCYZbx8l79r6ArWhrgGFMQ/fYQmq8SVv9Mh3BiqdZUjZQlNA3JiaJaBeGtZCbZU56
	1MbcGztg==;
Received: from ip6-localhost ([::1]:39430 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1mHI0d-008KYq-CK; Sat, 21 Aug 2021 03:49:27 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132]:33463) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1mHI0W-008KYh-R3
 for samba-technical@lists.samba.org; Sat, 21 Aug 2021 03:49:24 +0000
Received: by mail-lf1-x132.google.com with SMTP id p38so24792575lfa.0
 for <samba-technical@lists.samba.org>; Fri, 20 Aug 2021 20:49:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zHOVDDy6Elh+zfWbuB2hVkW/DiSiV2mlyNyWlRpko1k=;
 b=dDwcE8t7q/kyfCmqNuWd5qCbT4xcdx1l0pa96J5KWVMZ4d/FJdNXj53i4Zz0e/Ksj/
 ApUVZLoXFhXLBJge6j7CqP6X4Y0MgZ2MEjHd0LCKMzsB+LAWKLiitgiNKQPbtN3KX9L0
 DRVNkRQ77FenzaDRP8j4xfPdyE1WOQIpIDVaxu8Cj5YmdAi5EGo5o6/0w+ohtJhQmwBq
 uyEPvXuIe44GPXkmxkho++tNovgzAsuLXhbBzsGeB13wBpfiVeCLddD1Kx3jwIFDXN3H
 laxsPrnL96nMpcgDOYylmemk95dV9q9hCOSZgHIPdQWKJbBApQY3rhMIYNG+1PbJjDDj
 4/8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zHOVDDy6Elh+zfWbuB2hVkW/DiSiV2mlyNyWlRpko1k=;
 b=N7hGuw3Artvb9Jdpzwc/l8/XTAesW3LdV0rQKbHWp2H2zu39Mavv/XXr+obqKpJnOx
 P/smZPfr3Rd4bf8TwqPAFUE6BI8IjIGhG4RibGl6dlycDtnCjUvdgKkI7+r+ZODgkyPT
 MEPPFckc3JGbefa3tW7JeaBizwQbdXeKSMaCbD2dH/bp+4sOAIp2DbMTWmalJ2kn/yA8
 7xZWFOlly85GPDpfQNeZKOBpnzot82SfsGjUBaLcelfxDsjVlXxTROZKBcJBj3IQkoV+
 9CYB9n84yq+zGOy8NMjg8xvEMlXv7cUR4kMoMEE4WuX5NO/xnW1qE309Ys2DT+MiirjP
 7aTg==
X-Gm-Message-State: AOAM530LV63OGANgfRc/zrHR5lKArdeJYdVjAaqvKmckhz34vQXHglHs
 gd1puFpuJWcOTgMvIg7CyYfPtM9FpRzqiQIlncI=
X-Google-Smtp-Source: ABdhPJz9Yp/cOICdPWWe7C4f0+W/y7G8ogcXIR/JW21OvDVIDHMjDp+d36/NP9TLWjzkPBR7HX1+myUjZfHpuQc0IS0=
X-Received: by 2002:a05:6512:3455:: with SMTP id
 j21mr12302316lfr.282.1629517755929; 
 Fri, 20 Aug 2021 20:49:15 -0700 (PDT)
MIME-Version: 1.0
References: <CAH2r5mvxX6BqLvgWO18QE+rQsAZoAzopvu5S3fyy45a+Y-w_MQ@mail.gmail.com>
In-Reply-To: <CAH2r5mvxX6BqLvgWO18QE+rQsAZoAzopvu5S3fyy45a+Y-w_MQ@mail.gmail.com>
Date: Fri, 20 Aug 2021 22:49:04 -0500
Message-ID: <CAH2r5mvVHHgNcg1=YM25e7rK+LnXcvq0iTLW6Jf1BiP1XqoQDw@mail.gmail.com>
Subject: Re: [PATCH] oid_registry: Add OIDs for missing Spnego auth mechanisms
 to Macs
To: CIFS <linux-cifs@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
 David Howells <dhowells@redhat.com>, Paulo Alcantara <pc@cjr.nz>
Content-Type: multipart/mixed; boundary="000000000000ff730805ca09aa11"
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
From: Steve French via samba-technical <samba-technical@lists.samba.org>
Reply-To: Steve French <smfrench@gmail.com>
Cc: samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

--000000000000ff730805ca09aa11
Content-Type: text/plain; charset="UTF-8"

Fixed a typo in the patch (missing ',').  Updated patch attached.


On Fri, Aug 20, 2021 at 6:18 PM Steve French <smfrench@gmail.com> wrote:
>
>  In testing mounts to Macs, noticed that the OIDS for some
>  GSSAPI/SPNEGO auth mechanisms sent by the server were not
>  recognized and were missing from the header.
>
>  Signed-off-by: Steve French <stfrench@microsoft.com>
>
> diff --git a/include/linux/oid_registry.h b/include/linux/oid_registry.h
> index 3d8db1f6a5db..2728842721bc 100644
> --- a/include/linux/oid_registry.h
> +++ b/include/linux/oid_registry.h
> @@ -70,6 +70,9 @@ enum OID {
>
>         OID_spnego,                     /* 1.3.6.1.5.5.2 */
>
> +       OID_IAKerb,                     /* 1.3.6.1.5.2.5 */
> +       OID_PKU2U                       /* 1.3.5.1.5.2.7 */
> +       OID_Scram,                      /* 1.3.6.1.5.5.14 */
>         OID_certAuthInfoAccess,         /* 1.3.6.1.5.5.7.1.1 */
>         OID_sha1,                       /* 1.3.14.3.2.26 */
>         OID_id_ansip384r1,              /* 1.3.132.0.34 */
> @@ -104,6 +107,10 @@ enum OID {
>         OID_authorityKeyIdentifier,     /* 2.5.29.35 */
>         OID_extKeyUsage,                /* 2.5.29.37 */
>
> +       /* Heimdal mechanisms */
> +       OID_NetlogonMechanism,          /* 1.2.752.43.14.2 */
> +       OID_appleLocalKdcSupported,     /* 1.2.752.43.14.3 */
> +
>         /* EC-RDSA */
>         OID_gostCPSignA,                /* 1.2.643.2.2.35.1 */
>         OID_gostCPSignB,                /* 1.2.643.2.2.35.2 */
>
>
> --
> Thanks,
>
> Steve



-- 
Thanks,

Steve

--000000000000ff730805ca09aa11
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="0001-oid_registry-Add-OIDs-for-missing-Spnego-auth-mechan.patch"
Content-Disposition: attachment; 
	filename="0001-oid_registry-Add-OIDs-for-missing-Spnego-auth-mechan.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_ksl8sgpp0>
X-Attachment-Id: f_ksl8sgpp0

RnJvbSA5ZDVhZTM0YWE5Y2ZhYTAzZDIwNWY0YTdhMjY4ZDVlZTliMzNjNTdlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBTdGV2ZSBGcmVuY2ggPHN0ZnJlbmNoQG1pY3Jvc29mdC5jb20+
CkRhdGU6IEZyaSwgMjAgQXVnIDIwMjEgMTg6MTA6MzYgLTA1MDAKU3ViamVjdDogW1BBVENIXSBv
aWRfcmVnaXN0cnk6IEFkZCBPSURzIGZvciBtaXNzaW5nIFNwbmVnbyBhdXRoIG1lY2hhbmlzbXMg
dG8KIE1hY3MKCkluIHRlc3RpbmcgbW91bnRzIHRvIE1hY3MsIG5vdGljZWQgdGhhdCB0aGUgT0lE
UyBmb3Igc29tZQpHU1NBUEkvU1BORUdPIGF1dGggbWVjaGFuaXNtcyBzZW50IGJ5IHRoZSBzZXJ2
ZXIgd2VyZSBub3QKcmVjb2duaXplZCBhbmQgd2VyZSBtaXNzaW5nIGZyb20gdGhlIGhlYWRlci4K
ClJldmlld2VkLWJ5OiBQYXVsbyBBbGNhbnRhcmEgKFNVU0UpIDxwY0BjanIubno+ClNpZ25lZC1v
ZmYtYnk6IFN0ZXZlIEZyZW5jaCA8c3RmcmVuY2hAbWljcm9zb2Z0LmNvbT4KLS0tCiBpbmNsdWRl
L2xpbnV4L29pZF9yZWdpc3RyeS5oIHwgNyArKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgNyBpbnNl
cnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9vaWRfcmVnaXN0cnkuaCBiL2lu
Y2x1ZGUvbGludXgvb2lkX3JlZ2lzdHJ5LmgKaW5kZXggM2Q4ZGIxZjZhNWRiLi4wZjRhODkwMzky
MmEgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvbGludXgvb2lkX3JlZ2lzdHJ5LmgKKysrIGIvaW5jbHVk
ZS9saW51eC9vaWRfcmVnaXN0cnkuaApAQCAtNzAsNiArNzAsOSBAQCBlbnVtIE9JRCB7CiAKIAlP
SURfc3BuZWdvLAkJCS8qIDEuMy42LjEuNS41LjIgKi8KIAorCU9JRF9JQUtlcmIsCQkJLyogMS4z
LjYuMS41LjIuNSAqLworCU9JRF9QS1UyVSwJCQkvKiAxLjMuNS4xLjUuMi43ICovCisJT0lEX1Nj
cmFtLAkJCS8qIDEuMy42LjEuNS41LjE0ICovCiAJT0lEX2NlcnRBdXRoSW5mb0FjY2VzcywJCS8q
IDEuMy42LjEuNS41LjcuMS4xICovCiAJT0lEX3NoYTEsCQkJLyogMS4zLjE0LjMuMi4yNiAqLwog
CU9JRF9pZF9hbnNpcDM4NHIxLAkJLyogMS4zLjEzMi4wLjM0ICovCkBAIC0xMDQsNiArMTA3LDEw
IEBAIGVudW0gT0lEIHsKIAlPSURfYXV0aG9yaXR5S2V5SWRlbnRpZmllciwJLyogMi41LjI5LjM1
ICovCiAJT0lEX2V4dEtleVVzYWdlLAkJLyogMi41LjI5LjM3ICovCiAKKwkvKiBIZWltZGFsIG1l
Y2hhbmlzbXMgKi8KKwlPSURfTmV0bG9nb25NZWNoYW5pc20sCQkvKiAxLjIuNzUyLjQzLjE0LjIg
Ki8KKwlPSURfYXBwbGVMb2NhbEtkY1N1cHBvcnRlZCwJLyogMS4yLjc1Mi40My4xNC4zICovCisK
IAkvKiBFQy1SRFNBICovCiAJT0lEX2dvc3RDUFNpZ25BLAkJLyogMS4yLjY0My4yLjIuMzUuMSAq
LwogCU9JRF9nb3N0Q1BTaWduQiwJCS8qIDEuMi42NDMuMi4yLjM1LjIgKi8KLS0gCjIuMzAuMgoK
--000000000000ff730805ca09aa11--

