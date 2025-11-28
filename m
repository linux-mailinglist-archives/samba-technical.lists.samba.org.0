Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id F08F6C92D57
	for <lists+samba-technical@lfdr.de>; Fri, 28 Nov 2025 18:49:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=1j+Znd9SocCfUqvoBrfqtGnxCgC6ec4iwLsr5isAxlk=; b=UzfnDa03r7Ep0ldo89fvoFPOl2
	VrXAZ4F3OEFDsKG76dmMyLDJcLrRtrUMNt9vzP8+uRkoecqhpS4QnvavOOX4DB2nq3X7G5+qBL/2h
	uU55S3hMShhlTKXyEVmqwPTvYHQrzWtd3LH6DLNm0I1ztGB86rWOiwsJBODxQgA7YrLQ7jBpo4n0f
	5M4LoQS4HIFQinYucmKgXvM876C0h4ecTiFpv39R77GCgw4zyXa81Yr8hOWs/pQN9aU9Qo5h39DVi
	DRryGjiWBTmNqBvdAz2QvrRLe7HuGJxit1nWdNefvHSrkRyd2yDGu9Ynep912JwtSDU0GHYuzW8su
	JHhAMLXg==;
Received: from ip6-localhost ([::1]:53194 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vP2ai-00DXwe-6h; Fri, 28 Nov 2025 17:49:08 +0000
Received: from mail-qv1-xf30.google.com ([2607:f8b0:4864:20::f30]:46341) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vP2ac-00DXwX-Vd
 for samba-technical@lists.samba.org; Fri, 28 Nov 2025 17:49:05 +0000
Received: by mail-qv1-xf30.google.com with SMTP id
 6a1803df08f44-882379c0b14so16434626d6.1
 for <samba-technical@lists.samba.org>; Fri, 28 Nov 2025 09:49:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1764352141; x=1764956941; darn=lists.samba.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1j+Znd9SocCfUqvoBrfqtGnxCgC6ec4iwLsr5isAxlk=;
 b=E9yRYQXeqWWIg8EcE0MsRDL3jgXkIELKN7AbE2Gg12YcALKYBHxfW2HTAHiI/FHa9i
 nQrieOK/XvZCDDlDnmNe1a2adGFbSmxYk6frtzjtoAPfMxu7U2pzdp2A3na2ucIW/iuB
 aDEblE7zGwwvlNtpoNL41qCnDmARL6qnUR/8r/CAlGhpzRVi53MapLKxPnxXjGdGyyM0
 6+CPMJd8crO1vjSnxKhlEtScGgh4FBqKKIZ4wTlYunEXcHZ/yex/6tdVDymUoECil7lb
 G8MKOlJbTnIcW8Xs0P+UP+G4fJmoUELZDZHY5qQkma1scxYLImFWyposj107iZJILaha
 tRwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764352141; x=1764956941;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=1j+Znd9SocCfUqvoBrfqtGnxCgC6ec4iwLsr5isAxlk=;
 b=jZQnOIDumhqQMbFVO55dVntQfoIiIzdlNdMOsEJo2guFpjTX5+9tH/zx5AE+277l4s
 88fQFHixc5Xb6rHjVvi9tZUsyW4nG2tYUHrg6CVJQsD75Fw8fTWSKrfj1Wy3PQgHLXFE
 lu6/EKCjZwM8vlPIZerakY14aHz0BFu94DUqQozucnh4kMNvNeO63dswWp39pRzVv8x6
 BROTCHfy23eA9QIH+2Basr74uSa72lh0+i2a1yLNtNgeplMyS8I97aZvGwDLOqEyokno
 yp3fUI/UJB0Ny8OIuCEv8xCK6ZaaHENQZrgJWRbejPPZrriLpHY5lrpeuH2UUNL155iD
 uzyA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXL/wmW4Wqfr5LqiNr8621XLO4StdThnw4PrHiD2cEzaJJr2XZP/tU0eRHghWbsMbFCGLUgoWOI5N+ICnhzVng=@lists.samba.org
X-Gm-Message-State: AOJu0Ywzxh5EGr00FERowC9v0byVPYzsYZsKd871Pp8SZviOAGmu+vMP
 F75M7wf9/ZR0yyLGjYlNozUKWEAxUD/lLQM0JaP2HDCc8Xkf4/nbLdfw+ftu28ZFc2fCyFce/ah
 eEljGxmYeab1pVYNq8P8Gx8qOWty4mOY=
X-Gm-Gg: ASbGncswkV93MtGmObNkVQ5iPIlae39GsRUiLn78BizQJqc2LqBRE1X0myLrvb7tRS5
 qvp8fyPPtQa8t7jk7NgB5yJ/bg0X9inu+VCPcH6EyZhocKb0Sd8dwZGHURcqhgY9lD2sbDkT0T5
 5t4m+YyQM4khn31uMD6xzeN5tD+BV2g/xH+YcCCLYBCeOUpBCp4z0YTuphdh7Tmo7RbACWtZ2n0
 /t/UnJcULlAobwU8oFz7rej724rNcK5/KvxNxEAekA09kyA4Q46pPFKqFmmHVUDac5pobw0/0FN
 EQgzXO8MmNtVqBabiSNg7A2FhkfbLVmVOP4CLvem9gcXpXmFLh4RE/Xo4MB7qu6oc/go4h9pCom
 nNC/y4WU+snXK6AOvH/UfteC4+du0CF5P0YnyuwX2t1ugggB1klsTAXnGO+b6FOmyHPXMWbHQG2
 dnMegP2WVqUA==
X-Google-Smtp-Source: AGHT+IGOt1OZisRoBQVo5Br6M5w5h7ScU+QFY7p8Y+qTXg2UH2aI4E1LQ4aQXw/ZMZKsrfDcfRAfJ996vJlszgzMxUQ=
X-Received: by 2002:ad4:5c8e:0:b0:880:535d:d157 with SMTP id
 6a1803df08f44-8847c544e8dmr458060866d6.31.1764352140820; Fri, 28 Nov 2025
 09:49:00 -0800 (PST)
MIME-Version: 1.0
References: <20251128134951.2331836-1-metze@samba.org>
In-Reply-To: <20251128134951.2331836-1-metze@samba.org>
Date: Fri, 28 Nov 2025 11:48:49 -0600
X-Gm-Features: AWmQ_bmsnc-u3HX1k2Dmt7K5Pu8RM2fChqHU8lb56kDILHmFmHZBQwiO24VcJbU
Message-ID: <CAH2r5msBaRVPNkaMy0iQKPq9COR+p5+UUNf-B-Fh6=v7zKNRnQ@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: change git.samba.org to https
To: Stefan Metzmacher <metze@samba.org>
Content-Type: text/plain; charset="UTF-8"
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
From: Steve French via samba-technical <samba-technical@lists.samba.org>
Reply-To: Steve French <smfrench@gmail.com>
Cc: linux-cifs@vger.kernel.org, samba-technical@lists.samba.org,
 Namjae Jeon <linkinjeon@kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Fri, Nov 28, 2025 at 7:49=E2=80=AFAM Stefan Metzmacher <metze@samba.org>=
 wrote:
>
> This is the preferred way to access the server.

Are you sure that is the preferred way?  75% of the entries in
MAINTAINERS use "git git://" not "git http://" but ... I did notice
that for all github and gitlab ones they use "git http://"
But maybe for samba.org there is an advantage to https?!


> Cc: Steve French <smfrench@gmail.com>
> Cc: Namjae Jeon <linkinjeon@kernel.org>
> Cc: linux-cifs@vger.kernel.org
> Cc: samba-technical@lists.samba.org
> Signed-off-by: Stefan Metzmacher <metze@samba.org>
> ---
>  MAINTAINERS | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 047d242faf68..d55c1c263e71 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -6179,7 +6179,7 @@ L:        linux-cifs@vger.kernel.org
>  L:     samba-technical@lists.samba.org (moderated for non-subscribers)
>  S:     Supported
>  W:     https://wiki.samba.org/index.php/LinuxCIFS
> -T:     git git://git.samba.org/sfrench/cifs-2.6.git
> +T:     git https://git.samba.org/sfrench/cifs-2.6.git
>  F:     Documentation/admin-guide/cifs/
>  F:     fs/smb/client/
>  F:     fs/smb/common/
> @@ -13611,7 +13611,7 @@ R:      Sergey Senozhatsky <senozhatsky@chromium.=
org>
>  R:     Tom Talpey <tom@talpey.com>
>  L:     linux-cifs@vger.kernel.org
>  S:     Maintained
> -T:     git git://git.samba.org/ksmbd.git
> +T:     git https://git.samba.org/ksmbd.git
>  F:     Documentation/filesystems/smb/ksmbd.rst
>  F:     fs/smb/common/
>  F:     fs/smb/server/
> --
> 2.43.0
>


--=20
Thanks,

Steve

