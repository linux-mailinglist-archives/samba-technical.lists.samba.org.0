Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D37C39A231
	for <lists+samba-technical@lfdr.de>; Thu,  3 Jun 2021 15:29:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=4m5GiLWPLT8NAmM/JcAHICq+81ScLTNW7g/cfZPeQTo=; b=2W3BbzTK1VF/ih3YGGT0HosNHH
	OJcZ0f23nLtv2kMXOOyUbxl1p6D1QYGyD8efE1c0iTeJKsGjM+psEETOIGuA6WXzlfjCqPu1VMra6
	KBUvov8djycSDwlUakOlAwCG/QaPv+x0TOjPSHWqn8EHC9wL9ybbOTUDqp6ng4RZ7vaeYSEh2G6Ct
	h/mjQjDjSoo2e5pM/nMuaf5mn4Cp7Jqi6Eg32mtFVw0/SVOEGR5LWYTgx04fjLkptWcVbm5T5NcsQ
	Yk0g/OLKzys/gG8+7LaoIrH5cVMl2m/31S/dkv7RqSzq2vfJd1mNBDRPH5B5voD015rnnJ3JM22sT
	rdxeSZiA==;
Received: from ip6-localhost ([::1]:34408 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lonOZ-0036gU-NK; Thu, 03 Jun 2021 13:28:23 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634]:38866) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lonOR-0036gK-NP
 for samba-technical@lists.samba.org; Thu, 03 Jun 2021 13:28:20 +0000
Received: by mail-ej1-x634.google.com with SMTP id og14so3929651ejc.5
 for <samba-technical@lists.samba.org>; Thu, 03 Jun 2021 06:28:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ixsystems.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SD3pz/a5pUi/2BeMhXSTFaqwHoqrBlk0jCjr6o3gpao=;
 b=JuehWhGC6hIrjsukpL/a+yBuUItXmgCI5TbDN4kuUt5ER94gfrLnje2LVYTX0kBSq9
 zbuDuV56Zvc4l1CKsbwqpn3Ije2uOzgyHrw8SuB215WbPfZ2Ffj+gVpkujCaz5b+yECI
 MRsEI/z0XkbE+Qw7VL7oKov4trWSt0iiGGTlgDC9wUtenyYnrXup1SPzobIy0GzKG/hV
 xG7HTfuL8VxSIralRe/8iPh6trM8DFrBeYrlc+z3HQNUNSvF9d9bfBIXmFjcLc4Cl6u1
 erB+O4/vShjGZzvOvRJRKagTcrLIQ5x8S40PimZN2VwNcYG0mAkzV1+vgv/93k2EO5wf
 TecA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SD3pz/a5pUi/2BeMhXSTFaqwHoqrBlk0jCjr6o3gpao=;
 b=cBA4c5ge8p7pDrRGpnaSjEF3y6XBVxgXrXKqLb1ayEmrpzE4Dxpedx73gYn+sL3XY4
 pggp/3+XQSpfFTEXBRdywyFtPY5Pkl0cuvafoZPkbj5qbzBOqgL4ToeYXTICWLFzAnsY
 MRyl35oJ39zFUcpdxY+LWxaf1J312QMXDkG50HV6IRPuX4kLvlQvIHWzDbh7LP0Bg37g
 yTnKjMBM5HUJUNXnh2TMhfrXJORgSl46Dk77m/0u9vf082AqPRnfV3LM88IvFkDBMb8o
 SI8HiN6bMYUIGctJYZda/6kzdOMM64xd0XDWaJUb5l/x4OAsWQdFzvUcTPFSIDr1iUp1
 KxRQ==
X-Gm-Message-State: AOAM532XtM8Hv2jysd50VeS/t8G3d+YP2UTQkuRl09qMp408RU+O+DNK
 b85XeSnZDSLmC4Ti46BZhncl5B8XTzleGdBP0FF/xw==
X-Google-Smtp-Source: ABdhPJwA6D3xLbYncJ2r60gnTjJIedO3hEGwJkEPuRS87vBpMoqfwZ+GzTAmNjF/MZFTlD7UYlSbKe2JFG9810XxxIA=
X-Received: by 2002:a17:906:c1d2:: with SMTP id
 bw18mr38510799ejb.123.1622726894835; 
 Thu, 03 Jun 2021 06:28:14 -0700 (PDT)
MIME-Version: 1.0
References: <CAB5c7xqUC9mZ8-VFDmM44b=EL49yBiWkMikf8BWgU0FjC+25MA@mail.gmail.com>
 <562c85d7-c1d8-c978-6136-3ca538d12857@samba.org>
 <CAB5c7xqZ3OAB4YJDsU5tj9GAh+j4KiYUz_5wwOG1xeAkFcFH9g@mail.gmail.com>
 <54a0103bb925ebc76a6dd94829349adff7d94863.camel@samba.org>
 <20210601155911.GA4152169@jeremy-acer>
In-Reply-To: <20210601155911.GA4152169@jeremy-acer>
Date: Thu, 3 Jun 2021 09:28:03 -0400
Message-ID: <CAB5c7xrPC4udy+tTFd6MZPeCqkvQPr-4APVokV+L=K7iJ=hJbw@mail.gmail.com>
Subject: Re: JSON input / output for CLI utilities
To: Jeremy Allison <jra@samba.org>
Content-Type: text/plain; charset="UTF-8"
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
From: Andrew Walker via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andrew Walker <awalker@ixsystems.com>
Cc: samba-technical <samba-technical@lists.samba.org>,
 Andrew Bartlett <abartlet@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Here is some sample output for "net conf list":
```
root@debian:/CODE/samba# bin/default/source3/utils/net --json conf list | jq
{
  "version": {
    "major": 1,
    "minor": 0
  },
  "sections": [
    {
      "service": "global",
      "is_share": false,
      "parameters": []
    },
    {
      "service": "share",
      "is_share": true,
      "parameters": [
        {
          "name": "path",
          "raw": "/tank",
          "parsed": "/tank"
        },
        {
          "name": "guest ok",
          "raw": "no",
          "parsed": false
        },
        {
          "name": "read only",
          "raw": "false",
          "parsed": false
        },
        {
          "name": "vfs objects",
          "raw": "streams_xattr zfsacl",
          "parsed": "streams_xattr zfsacl"
        }
      ]
    }
  ]
}
```
Basically, root JSON object has two keys, "version", and "sections". Each
section is composed of a service name, whether it's a share, and an array
of parameters.
Each parameter has "name", "raw", and "parsed" keys. The name is the
parameter name, the raw output is the string returned from libsmbconf, and
parsed is an attempt to put the value into a correct-ish JSON type.

Is there anything we should add here?

I took the liberty of making it so that "net conf setparm" can take an
array of parameters:
```
root@debian:/CODE/samba# bin/default/source3/utils/net --json conf setparm
'{"service": "share", "parameters": [{"name": "read only", "parsed":
false}, {"name": "vfs objects", "raw": "streams_xattr zfsacl"}]}'
```
Parameters can be set either by parsed or raw values.

"net conf delparm" takes an array of JSON parameters:
```
 bin/default/source3/utils/net --json conf delparm '{"service": "share",
"parameters": [{"name": "vfs objects"}]}'
```

"net conf addshare" can set all required parameters on share creation:
```
root@debian:/CODE/samba# bin/default/source3/utils/net --json conf addshare
'{"service": "share", "parameters": [{"name": "read only", "parsed":
false}, {"name": "vfs objects", "raw": "streams_xattr zfsacl"}, {"name":
"path", "raw": "/tank"}]}'
```

Any feedback regarding how this is structured is welcome.
