Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CFBD170021
	for <lists+samba-technical@lfdr.de>; Wed, 26 Feb 2020 14:34:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=/3joBOGXGZH+WbZlnawolE6q5foKAZpNHPfB3WNXZSw=; b=RuqH5oKY9lH5N3oIGI4C5s9ob0
	UFh+CVsAcoLvIt4L5nwQGrqZDDHqjKVL/mKgZjiLIktJK7oJ33CHQl3v7pYddmmyHhS++3i+PsFz6
	B/jfK5D0re9Y8i+KayFIUUAouvZ8AkYXf6W+qM5s9nQhI4Ae1AAsfZORrdITVinJ9u6GuINWT+jez
	4BF9BZENqgOrYOmmxH7+XTs/+WGL6UqMZ+TxnzfiSBxlzDaBkOSbUJ9YVY/whNpYz1Limn+gsWHxw
	gaFtvRWJL65AFTpqW3uBsgsCwwWgzng6i5/8b7KWUVC/leExG7aRLa5x3diRtQvb7cfpVSNcfH1Ms
	F7zYL6lw==;
Received: from localhost ([::1]:45434 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1j6wor-00BmHm-O5; Wed, 26 Feb 2020 13:33:45 +0000
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b]:39515) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1j6wol-00BmHf-8J
 for samba-technical@lists.samba.org; Wed, 26 Feb 2020 13:33:42 +0000
Received: by mail-lj1-x22b.google.com with SMTP id o15so3107781ljg.6
 for <samba-technical@lists.samba.org>; Wed, 26 Feb 2020 05:33:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=/3joBOGXGZH+WbZlnawolE6q5foKAZpNHPfB3WNXZSw=;
 b=B8ukFtNQHzSMQ7vEzCuV5kAcpqPzSPSToP/mXAlSVrytzN2eP4hfaos0idCEp2KVNN
 5It84ekXeVLFW025jg6NdW56w5cOJ1VR4yEgAPzoYiavkSZGMJivelATEBIlWTBsXCkN
 BgQE3ICK1Ttc0i17gUJS0vxQFtN8ljxg4rwkl4x5C0Hy+Dcynctw8XAUuxmVqbWI0nlg
 oyr+eoZAHCmwVD13LHTH1iaItJttdxiUI+bd6KyX9RBLtjUzEMDLg9zKhPuRMWFNUC3x
 k24K+zmsttdwvYoPqyoULliaOQN6K7QkD2+k2/bEkgzRTRV5v64/b5cgYknPZHbnbUVi
 +QIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=/3joBOGXGZH+WbZlnawolE6q5foKAZpNHPfB3WNXZSw=;
 b=JM8UI/y1qwfEsbMsF2LYzh9xwKQOG5GCwoSONzizgA2ZQkQrtSXZZ3pyPrmt5FQDL/
 6M+Y0627TLA5VHqXM92OYUCIZPmUyYgt3RvqTXu1Eaq2sa1DMLK9jzivjaA7C2isByoY
 ljBYqMnrY9NWwT8N5JsJTY9dIRaBpCp4Q63RAtVZkWh8xb2uZArmJoPACzN0cQPTc/Ip
 u3+DNALtTLB8SKnVaCuGLxcMH2ibOkoxHr7viREirsMrJ8nXdc3c7jvb8INvCh/+UTTA
 7FYqU12522xtCddyeTwAxsx8nmABnNBR2M5AUDHTOqVtLpu/AXEf6JxPiaNew1+hZOFB
 zP0A==
X-Gm-Message-State: ANhLgQ1ZY+NU6ueMmZe7R1mgomkwe6lwdPbmZC5bX7qKO+yL/UFKBzGU
 VM9j6tLv/rbSsza/G1gNKiFNhpDIS1jXmxf5Ji8=
X-Google-Smtp-Source: APXvYqxCQwQSNwP6CqIu8rmNPicsiqn8IO70wK/7DcUVBuYse9g9zAZKy7wItu3uWznRf1KEz0R+rLK+Imi5uddfV3Y=
X-Received: by 2002:a2e:5304:: with SMTP id h4mr3007074ljb.75.1582724017787;
 Wed, 26 Feb 2020 05:33:37 -0800 (PST)
MIME-Version: 1.0
References: <CAC-fF8Tp_mPkza63VxtiXm3fdnDSfr616roVnK-PwDXqBodnhQ@mail.gmail.com>
 <6408dd32-53f3-2622-d6b9-04928793cc8b@samba.org>
 <CAC-fF8T6dGjDbH3YFpZpEA+Rtoppj+sJ4bZtt9ZDMfH85_UuUg@mail.gmail.com>
 <29a0fc8162de6bde7ea127956efb7de29b4fce3e.camel@redhat.com>
 <CAC-fF8QyT+t0Cmi3BdJe8kJ-LRL_BvvhQr76GwF2t3ZQJWsDDw@mail.gmail.com>
 <dc76b713e4e4c94d396a0d95ebb5145c63ce4a4d.camel@redhat.com>
 <CAC-fF8RrV1XtnaB0va3Bv8++c17qXKh+JtdSUqS00Eg-3OZUfQ@mail.gmail.com>
In-Reply-To: <CAC-fF8RrV1XtnaB0va3Bv8++c17qXKh+JtdSUqS00Eg-3OZUfQ@mail.gmail.com>
Date: Wed, 26 Feb 2020 14:33:26 +0100
Message-ID: <CAC-fF8RSs2NaB6B_v=UKp0KpDiu75kzLy+ioX9nZNy09miSQMg@mail.gmail.com>
Subject: Re: ADV190023 | LDAP channel binding support
To: Simo Sorce <simo@redhat.com>
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
From: Isaac Boukris via samba-technical <samba-technical@lists.samba.org>
Reply-To: Isaac Boukris <iboukris@gmail.com>
Cc: Stefan Metzmacher <metze@samba.org>, Andreas Schneider <asn@samba.org>,
 Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>,
 Andrew Bartlett <abartlet@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Mon, Feb 24, 2020 at 9:37 PM Isaac Boukris <iboukris@gmail.com> wrote:
>
> On Mon, Feb 24, 2020 at 9:28 PM Simo Sorce <simo@redhat.com> wrote:
> >
> > On Mon, 2020-02-24 at 17:41 +0100, Isaac Boukris wrote:
> > > On Mon, Feb 24, 2020 at 2:35 PM Simo Sorce <simo@redhat.com> wrote:
> > > > On Sat, 2020-02-22 at 20:09 +0100, Isaac Boukris wrote:
> > > > > On Tue, Feb 18, 2020 at 5:48 PM Stefan Metzmacher <metze@samba.or=
g> wrote:
> > > > >
> > > > > > I think we need input from dochelp to answer 2 questions:
> > > > > > 1. which kind of channel bindings are expected/used by windows?
> > > > > >    I assume tls-server-end-point. I guess MS-ADTS would be the =
place
> > > > > >    to define these details for ldaps.
> > > > >
> > > > > I noticed more another reference to channel-bindings in MS-KILE, =
I
> > > > > think maybe KERB_AP_OPTIONS_CBT ad element is the way to tell the
> > > > > server to require CB when LdapEnforceChannelBinding is set to 1 o=
nly,
> > > > > needs testing.
> > > > >
> > > > > 3.2.5.8 AP Exchange
> > > > > If ChannelBinding is set to TRUE, the client sends
> > > > > AD-AUTH-DATA-AP-OPTIONS data in an AD-IF-
> > > > > RELEVANT element ([RFC4120] section 5.2.6.1). The Authorization D=
ata
> > > > > Type AD-AUTH-DATA-AP-
> > > > > OPTIONS has an ad-type of 143 and ad-data of KERB_AP_OPTIONS_CBT
> > > > > (0x4000). The presence of
> > > > > this element indicates that the client expects the applications
> > > > > running on it to include channel binding
> > > > > information ([RFC2743] section 1.1.6 and [RFC2744]) in AP request=
s
> > > > > whenever Kerberos
> > > > > authentication takes place over an "outer channel" such as TLS.
> > > > > Channel binding is provided using the
> > > > > ChannelBinding variable specified in section 3.2.1.
> > > > >
> > > > > 3.4.5
> > > > > If the ApplicationRequiresCBT parameter (section 3.4.1) is set to
> > > > > TRUE, the server, if so configured,
> > > > > SHOULD<67> return GSS_S_BAD_BINDINGS whenever the AP exchange req=
uest
> > > > > message contains
> > > > > an all-zero channel binding value and does not contain the
> > > > > AD-IF-RELEVANT element ([RFC4120]
> > > > > section 5.2.6.1) KERB_AP_OPTIONS_CBT.
> > > >
> > > > Very interesting, we should add support to decode this AD in MIT kr=
b5
> > > > and exposes it via naming attributes or context options, whatever m=
akes
> > > > the most sense.
> > >
> > > Yeah, although I can't really think of something that would work,
> > > given we want to know that before calling accept() on the input token=
.
> > > On clients supporting CB, maybe we can add this ad-element via a
> > > gss_set_name_attribute() call, not sure.
> >
> > We might even just see there are CBs in gss_init_sec_context() and just
> > do it automatically. The only question is whether this can cause
> > interop issues which requires a more nuanced use of these.
>
> Right, doing it automatically make sense. I think an unknown
> ad-element in ad-if-relevant container shouldn't cause interop issues.

It seems Windows clients send this same list of ad-element, over TLS
or not.  I think "AD-TARGET-PRINCIPAL" is for what they called in the
blog post "bound to SPN", not sure.

authorization-data: 1 item
    AuthorizationData item
        ad-type: AD-IF-RELEVANT (1)
        ad-data: 3081a9938298930=E2=80=A6
            AuthorizationData item
                ad-type: AD-TOKEN-RESTRICTIONS (141)
                ad-data: 303330=E2=80=A6
            AuthorizationData item
                ad-type: AD-LOCAL (142)
                ad-data: f0bca424242eaf2...
            AuthorizationData item
                ad-type: AD-AP-OPTIONS (143)
                ad-data: 00400000
                    AD-AP-Options: 0x00004000, ChannelBindings
                        .... .... .... .... .1.. .... .... .... =3D
ChannelBindings: Set
            AuthorizationData item
                ad-type: AD-TARGET-PRINCIPAL (144)
                ad-data: 6c006400602=E2=80=A6
                    Target Principal: ldap/sdc.smb.net@SMB.NET

