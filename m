Return-Path: <samba-technical-bounces@lists.samba.org>
Delivered-To: lists+samba-technical@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IIJ4MLOsb2miEwAAu9opvQ
	(envelope-from <samba-technical-bounces@lists.samba.org>)
	for <lists+samba-technical@lfdr.de>; Tue, 20 Jan 2026 17:26:27 +0100
X-Original-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B7204777A
	for <lists+samba-technical@lfdr.de>; Tue, 20 Jan 2026 17:26:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=g08WQFIgUqYsdnUwyz/IjC6WJzN7LcBnCjZVfwZdMqQ=; b=Tmbu/kdO7Ma9M3q6OVXc57h+6R
	BCB84tQUReHfg0w8mHd7o5go1SSPnQbJrOabH15Ra02UbNioFq+BqaA6vw17BleuZIQ/e3quecXU1
	MhcW+tv4vYNqLx/3ru4plI/H0askt9zsX6eBaWM3hci27Aju13Cqx5aO9QS8KtD5/SdlzsYMy95sI
	j+LSPTuN33CXpzgaN02INlwHnZY1rAMfvl7eYN9skKAxdjOJjlSFpQQdbJF1KRW5VFD9hUJjyp17d
	yhgOU35MGQ7+YH6OPJRWzP5wXBmm8c/uB2NLOBS1Ob1/2cGaW+eR3Btz5g4iGLThUr8u3wQq/WKoS
	DzB7UCnw==;
Received: from ip6-localhost ([::1]:60590 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1viEXy-000kCX-Hz; Tue, 20 Jan 2026 16:25:38 +0000
Received: from hr2.samba.org ([144.76.82.148]:42728) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1viEXn-000kC2-Uu; Tue, 20 Jan 2026 16:25:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:To:From:Date:CC;
 bh=g08WQFIgUqYsdnUwyz/IjC6WJzN7LcBnCjZVfwZdMqQ=; b=A6XFLV6rPF8upygCpu7bokf5Og
 f+LipUQgfiZwhxaJhn8bCJfbtKjT8nhytm4+0iPmBZYKqMVt0Tz5AP+KE26kuHv73iU1SyLrXMme+
 niAybFHwTfrHEtpJZuta6jja87L/WK/mebLjO94Ww66QXW2ikBNyk4DluZwKoqK6lakdFINzEDvHm
 DbilrHDfrkwKyxgh9PyQ7hx/dy+SINFZ/4fQjSD+/Au0k3YguG/xSgkX23+E1gwdSkP+dA7PNGdqm
 5D1be/TFqlpm3xTb11knKsX0BPwJTiIbelqKgB5Hsq0kLb9TiX9q1szP1CaqBvOFldhtH1rMUloHY
 baToa2RI6yZcGF571NFvqH4VeIE7aTtTbvqNKQqzafaXVAmDMKx2eGNWbt6kK9E2X7Maw0qOIDXlH
 Cj09xn5ZWuCYo6mBskMDc4RzgCE8hL4/eFmzArQ71yBNTPZZ1dS7zL9hL3CfsbQlo6U2yxCRaqAPa
 H1FtNbyonwWTkHVGjV90kBZ5;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1viEXV-00000001OEd-371B; Tue, 20 Jan 2026 16:25:10 +0000
Received: from bjacke by pell.int.sernet.de with local (Exim 4.93)
 (envelope-from <bjacke@sernet.de>)
 id 1viEXL-002kNf-7D; Tue, 20 Jan 2026 17:24:59 +0100
Date: Tue, 20 Jan 2026 17:24:59 +0100
To: samba-announce@lists.samba.org, samba@lists.samba.org,
 samba-technical@lists.samba.org
Subject: [Announce] Samba 4.24.0rc1 Available for Download
Message-ID: <20260120162459.GA654736@sernet.de>
Mail-Followup-To: samba-announce@lists.samba.org, samba@lists.samba.org,
 samba-technical@lists.samba.org
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
X-Q: Die Schriftsteller koennen nicht so schnell schreiben, wie die
 Regierungen Kriege machen; denn das Schreiben verlangt Denkarbeit. - Brecht
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
From: =?utf-8?q?Bj=C3=B6rn_JACKE_via_samba-technical?=
 <samba-technical@lists.samba.org>
Reply-To: =?iso-8859-1?Q?Bj=F6rn?= JACKE <bjacke@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>
X-Spamd-Result: default: False [-1.21 / 15.00];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2a01:4f8:192:486::/64:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.samba.org:s=2954282];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_MIXED(0.00)[];
	FROM_HAS_DN(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.samba.org,reject];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	R_DKIM_REJECT(0.00)[samba.org:s=42];
	DKIM_TRACE(0.00)[lists.samba.org:+,samba.org:-];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	TAGGED_RCPT(0.00)[samba-technical];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[samba-technical@lists.samba.org,samba-technical-bounces@lists.samba.org];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:24940, ipnet:2a01:4f8::/32, country:DE];
	HAS_REPLYTO(0.00)[bjacke@samba.org];
	RCPT_COUNT_THREE(0.00)[3];
	DBL_BLOCKED_OPENRESOLVER(0.00)[samba.org:url,samba.org:replyto,libera.chat:url,lists.samba.org:dkim]
X-Rspamd-Queue-Id: 4B7204777A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Release Announcements
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

This is the first release candidate release of Samba 4.24.  This is *not*
intended for production environments and is designed for testing
purposes only.  Please report any defects via the Samba bug reporting
system at https://bugzilla.samba.org/.

Samba 4.24 will be the next version of the Samba suite.


UPGRADING
=3D=3D=3D=3D=3D=3D=3D=3D=3D


NEW FEATURES/CHANGES
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

Authentication information audit support
----------------------------------------

There are some Active Directory attributes that are not secret, but
are relied on in some forms of authentication. Changes to these
attributes could indicate surreptitious activity. The
"dsdb_password_audit" and "dsdb_password_json_audit" debug classes now
log changes to the following attributes:

 * altSecurityIdentities
 * dNSHostName
 * msDS-AdditionalDnsHostName
 * msDS-KeyCredentialLink
 * servicePrincipalName

For the JSON logs, changes to these will be logged with the "action"
field set to "Auth info change".


vfs_streams_xattr can hold larger streams
-----------------------------------------

On Linux the size of a single extended attribute is limited to 65536
bytes of size. For some file systems, this is also the overall limit
of space for xattrs, but for example xfs can hold more than that 64k
of extended xattrs, although the individual xattr is still limited to
64k. Setting

streams_xattr:max xattrs per stream =3D 1

to a higher value than 1 will allow Samba to shard the stream to more
than one xattr. It has an artificial limit of 16 for a maximum stream
length of 1MB.


Support for remote password management (Entra ID SSPR, Keycloak)
----------------------------------------------------------------

When a system such as Entra ID or Keycloak wants to change a user's
password in its own database as well as in AD, it will use a password
reset, meaning it does not transmit the old password to the domain
controller. Normally a password reset avoids password history and age
checks, which would allow a cloud password change to bypass
on-premises password policies. To address this, a password reset using
the "policy hints" control should respect password policies, as if it
were an ordinary password change. Both Entra ID and Keycloak use this,
but until now Samba did not understand this control, and would reject
these reset requests.

Now Samba AD will recognise the policy hints control and enforce local
policy. This allows Microsoft Entra self-service password reset (SSPR)
to work, and for Keycloak to work with the "password policy hints
enabled" option.


Kerberos PKINIT KeyTrust logon support
--------------------------------------

Samba servers configured with the embedded heimdal KDC and running as an AD=
DC,
now support "Windows Hello for Business Key-Trust logons". This allows the
PKINIT authentication mechanism to be used with self-signed keys.

The samba-tool computer and user commands have a new "keytrust"
sub-command which allows for the setting and viewing of the public key
details for computer and user accounts. This stores the public key
details in msDS-KeyCredentialLink attribute of the account.


msDS-KeyCredentialLink validation
---------------------------------

Updates to the msDS-KeyCredentialLink attribute are validated against the
rules specified by MS-ADTS 3.1.1.5.3.1.1.6.

Kerberos PKINIT strong/flexible key mappings
--------------------------------------------

Samba servers configured with the embedded heimdal KDC and running as an AD=
DC
now support "Windows Strong and Flexible key mappings" as outlined in
Microsoft KB5014754: Certificate-based authentication changes on Windows do=
main
controllers.

The default enforcement mode ("full") allows only strong certificate
mappings. The smb.conf option

  strong certificate binding enforcement =3D compatibility

will allow weak mappings where the certificate is newer than the user
account. The option "none" will allow any mappings.

The mappings for an account should be placed in the altSecurityIdentities
attribute and follow the syntax documented in KB5014754.


Kerberos PKINIT SID extension
-----------------------------

PKINIT authentication now supports certificates containing an Object SID
extension (extension 1.3.6.1.4.1.311.25.2), this is considered to be a STRO=
NG
mapping for KB5014754.

The computer and user samba-tool commands have a new sub-command
"generate-csr" to generate certificate signing requests.


KDC includes PAC by default
---------------------------

Samba will ignore the value provided by the client in "PA-PAC-REQUEST"
and always include a PAC in responses, unless "kdc always generate
pac" is set to "no".


KDC can insist clients request canonicalization
-----------------------------------------------

Canonicalization of principal client names is not mandatory in
Kerberos (per RFC4120), but must be requested by the client. In some
circumstances allows a client to deceive Active Directory member
servers (known as the "dollar ticket" attack).

The new configuration option "kdc require canonicalization" can be
used to require that clients request canonicalization; if they do not,
their AS_REQ requests will be rejected as if the account was unknown.

The default value is "no", for backward compatibility. Windows clients
will ask for canonicalization by default, so in Windows-heavy
environments it is safe and recommended to set this to "yes".

KDC can avoid potentially confusing canonicalization
----------------------------------------------------

Currently when the client does not request canonicalization, when the
KDC looks up a name and there is no match it will append a "$" to the
name and try again. An attacker who can create arbitrary machine
accounts can sometimes get tickets for Unix users by mimicking their
names (the "dollar ticket" attack).

The configuration option

  kdc name match implicit dollar without canonicalization =3D no

can be used to disable this behaviour for clients that do not request
canonicalization. Probably this only affects traditional Unix clients,
as Windows clients use canonicalization. If affected clients want a
ticket for a machine account, they will have to use the full name
including the dollar (e.g. "server$", not "server").

If the "kdc require canonicalization" option cannot be set to "yes"
(because some clients do not request canonicalization) setting this
option to "no" is a good alternative.


KDC provides Kerberos acceptors with canonical client names
-----------------------------------------------------------

By default the KDC will now send Kerberos services the canonicalized
name (the sAMAccountName from the PAC) rather than trusting the cname.

To return to the old behaviour, use

  krb5 acceptor report canonical client name =3D no

in the smb.conf.

This currently affects Heimdal KDC only, not MIT.


KDC recommended configuration:
-----------------------------
strong certificate binding enforcement                            full
kdc always include pac                                            yes
kdc require canonicalization                                      yes

If unable to use "kdc require canonicalization" =3D "yes", then
"kdc name match implicit dollar without implicit canonicalization" should be
set to "no" if possible.

samba tool
----------

Two new sub-commands have been added to the user and computer commands:

user|computer generate-csr
    Generate a Certificate signing request for an account containing the
    Object SID extension  (extension 1.3.6.1.4.1.311.25.2)

user|computer keytrust
   Add the public key details of a self signed certificate to an account.
   The command supports PEM and DER encoded public keys.


New AIO rate-limiting VFS module
--------------------------------
A new VFS stackable module has been introduced to implement rate-limiting f=
or
asynchronous I/O operations. Administrators can now enforce throughput ceil=
ings
by defining limits in either operations per second or bytes per second. The
module utilizes a token-based algorithm to calculate real-time I/O load; wh=
en
limits are exceeded, it dynamically injects millisecond delays into async
operations to maintain the defined threshold.


REMOVED FEATURES
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D


smb.conf changes
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

  Parameter Name                          Description     Default
  --------------                          -----------     -------
  strong certificate binding enforcement  New             full
  certificate backdating compensation     New             0
  kdc always include pac                  New             yes
  kdc require canonicalization            New             no
  kdc name match implicit dollar without canonicalization
                                          New             yes

KNOWN ISSUES
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

https://wiki.samba.org/index.php/Release_Planning_for_Samba_4.24#Release_bl=
ocking_bugs


#######################################
Reporting bugs & Development Discussion
#######################################

Please discuss this release on the samba-technical mailing list or by
joining the #samba-technical:matrix.org matrix room, or
#samba-technical IRC channel on irc.libera.chat

If you do report problems then please try to send high quality
feedback. If you don't provide vital information to help us track down
the problem then you will probably be ignored.  All bug reports should
be filed under the Samba 4.1 and newer product in the project's Bugzilla
database (https://bugzilla.samba.org/).


=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=3D=3D Our Code, Our Bugs, Our Responsibility.
=3D=3D The Samba Team
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Download Details
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

The uncompressed tarballs and patch files have been signed
using GnuPG (ID AA99442FB680B620).  The source code can be downloaded
=66rom:

        https://download.samba.org/pub/samba/rc/

The release notes are available online at:

        https://download.samba.org/pub/samba/rc/samba-4.24.0rc1.WHATSNEW.txt

Our Code, Our Bugs, Our Responsibility.
(https://bugzilla.samba.org/)

                        --Enjoy
                        The Samba Team

